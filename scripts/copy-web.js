/**
 * copy-web.js
 * Cross-platform (Windows + macOS runner) copy step.
 * Syncs the static web app into www/ so Capacitor can BUNDLE it as the
 * native app's content (no remote server.url — a real offline app,
 * per Apple guideline 4.2).
 *
 * Run via:  npm run build:web
 */
const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const www = path.join(root, "www");

// Individual files to bundle.
const FILES = [
  "index.html",
  "jsQR.min.js",
  "sw.js",
  "manifest.webmanifest",
  "icon-180.png",
  "icon-192.png",
  "icon-512.png",
  "privacy.html",
  "support.html",
];

// Whole folders to bundle.
const DIRS = ["pdfs"];

// Fresh www/ every run so it always mirrors source.
fs.rmSync(www, { recursive: true, force: true });
fs.mkdirSync(www, { recursive: true });

let copied = 0;
const missing = [];

for (const f of FILES) {
  const src = path.join(root, f);
  if (!fs.existsSync(src)) {
    missing.push(f);
    continue;
  }
  fs.cpSync(src, path.join(www, f));
  copied++;
  console.log("  + " + f);
}

for (const d of DIRS) {
  const src = path.join(root, d);
  if (!fs.existsSync(src)) {
    missing.push(d + "/");
    continue;
  }
  fs.cpSync(src, path.join(www, d), { recursive: true });
  copied++;
  console.log("  + " + d + "/ (folder)");
}

console.log(`\nbuild:web -> ${www}`);
console.log(`Copied ${copied} item(s).`);

if (missing.length) {
  // These are expected to exist in this repo; fail loudly so a broken
  // bundle never silently ships.
  console.error("\nERROR: missing source asset(s): " + missing.join(", "));
  process.exit(1);
}
