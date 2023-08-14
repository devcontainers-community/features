#!/usr/bin/env -S deno run -A
import { readFile, writeFile } from "node:fs/promises";
import { $ } from "npm:zx";
import process from "node:process";
import { temporaryDirectory, temporaryWrite } from "npm:tempy";
import { resolve } from "node:path";

const mdPath = resolve("README.md");
let md = await readFile(mdPath, "utf8");

const tempDirPath = temporaryDirectory();
process.chdir(tempDirPath);
$.cwd = process.cwd();

await $`oras pull ghcr.io/${process.env.GITHUB_REPOSITORY}:latest`;
const devcontainerCollection = JSON.parse(
  await readFile("devcontainer-collection.json", "utf8")
);

const featureListMD = devcontainerCollection.features
  .map((f) => `- **[${f.name}](${f.documentationURL})** - ${f.description}`)
  .join("\n");

md = md.replace(
  /(<!-- START_FEATURE_LIST -->)([\s\S]*?)(<!-- END_FEATURE_LIST -->)/,
  `$1\n\n${featureListMD}\n\n$3`
);
await writeFile(mdPath, md);
