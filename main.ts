#!/usr/bin/env -S deno run -A
import { readFile, writeFile } from "node:fs/promises";
import * as YAML from "npm:yaml";
import { $ } from "npm:execa";
import { temporaryDirectory } from "npm:tempy";
import { join } from "node:path";
import process from "node:process";

// https://github.com/sindresorhus/execa#verbose-mode
process.env.NODE_DEBUG = "execa";

const devcontainerCollection = {
  features: [] as any[],
};

const featureIds = YAML.parse(await readFile("feature-ids.yml", "utf8"));
for (const id of featureIds) {
  // TODO: Fetch from the 'latest' OCI artifact instead of 'main'.
  const response = await fetch(
    `https://github.com/jcbhmr/features-${id}/raw/main/devcontainer-feature.json`
  );
  const devcontainerFeature = await response.json();
  devcontainerCollection.features.push(devcontainerFeature);
}

const tempDirPath = temporaryDirectory();
const $$ = $({ cwd: tempDirPath, stdio: "inherit" });
await writeFile(
  join(tempDirPath, "devcontainer-collection"),
  JSON.stringify(devcontainerCollection, null, 2)
);

const annotations = {
  $manifest: {
    "com.github.package_type": "devcontainer_collection",
  },
  "devcontainer-collection.json": {
    "org.opencontainers.image.title": "devcontainer-collection.json",
  },
};

await writeFile(
  join(tempDirPath, "annotations.json"),
  JSON.stringify(annotations, null, 2)
);

await $$`tree -a`;

await $$`oras push \
  ghcr.io/${process.env.GITHUB_REPOSITORY} \
  --config /dev/null:application/vnd.devcontainers \
  --annotation-file ${join(tempDirPath, "annotations.json")} \
  devcontainer-collection.json:application/vnd.devcontainers.collection.layer.v1+json`;
