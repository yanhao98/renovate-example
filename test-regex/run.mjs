import * as path from "node:path";
import { fileURLToPath } from "node:url";
import fs from "node:fs";

const __dirname = path.dirname(fileURLToPath(import.meta.url));


function extractMatchResult(regex, text) {
  const pattern = new RegExp(regex);
  const match = text.match(pattern);
  console.log("match", match);
  return match;
}

const filecontent = fs.readFileSync(path.join(__dirname, "file.txt"), "utf8");

(() => {
  const regex = "# renovate: datasource=(?<datasource>\\S+) depName=(?<depName>\\S+):(?<currentValue>\\S+)@(?<currentDigest>\\S+)";
  extractMatchResult(regex, filecontent);
})();
