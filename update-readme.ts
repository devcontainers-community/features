#!/usr/bin/env -S deno run -A
import { readFile, writeFile } from "node:fs/promises";
import { $ } from "npm:zx";

let md = await readFile("README.md", "utf8");
const collection = `ghcr.io/${process.env.GITHUB_REPOSITORY}:latest`;
const featureList = JSON.parse(
  (await $`oras manifest fetch ${collection}`).toString()
);
const featureListMD = featureList.features
  .map((f) => `- **[${f.name}](${f.documentationURL})** - ${f.description}`)
  .join("\n");
md = md.replace(
  /<!-- BEGIN_FEATURE_LIST -->([\s\S]*?)<!-- END_FEATURE_LIST -->/,
  `\n${featureListMD}\n`
);
await writeFile("README.md", md);
