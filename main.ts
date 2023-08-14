#!/usr/bin/env -S deno run -A
import { mkdir, readFile, writeFile } from "node:fs/promises";
import * as YAML from "npm:yaml";
import { $ } from "npm:execa";

const features = YAML.parse(await readFile("features.yml", "utf8"));
const collection = {
  features: [],
};
for (const id of features) {
  const response = await fetch(
    `https://github.com/jcbhmr/features-${id}/raw/main/devcontainer-feature.json`
  );
  const feature = await response.json();
  collection.features.push(feature);
}
await mkdir("dist", { recursive: true });
await writeFile("dist/feature-collection.json", JSON.stringify(collection));

const $$ = $({ cwd: "dist", stdio: "inherit" });
await $$`oras push ghcr.io/${process.env.GITHUB_REPOSITORY} .`;
