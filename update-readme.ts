#!/usr/bin/env -S deno run -A
import { readFile, writeFile } from "node:fs/promises";
import { $ } from "npm:zx";
import process from "node:process";
import { temporaryDirectory, temporaryWrite } from "npm:tempy";
import { join } from "node:path";

let md = await readFile("README.md", "utf8");

const tempDirPath = temporaryDirectory();
$.cwd = tempDirPath;

await $`oras pull ghcr.io/${process.env.GITHUB_REPOSITORY}:latest`;
const devcontainerCollection = JSON.parse(
  await readFile(join($.cwd, "devcontainer-collection.json"), "utf8")
);
console.log(devcontainerCollection)

const featureListMD = devcontainerCollection.features
  .filter((f) => f.documentationURL)
  .filter((f1) => devcontainerCollection.features.filter((f2) => f1 !== f2).every((f2) => f1.documentationURL !== f2.documentationURL))
  .map((f) => `- **[${f.name}](${f.documentationURL})** - ${f.description}`)
  .join("\n");
console.log(featureListMD)

md = md.replace(
  /(<!-- START_FEATURE_LIST -->)([\s\S]*?)(<!-- END_FEATURE_LIST -->)/,
  `$1\n\n${featureListMD}\n\n$3`
);
await writeFile("README.md", md);
