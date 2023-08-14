#!/usr/bin/env -S deno run -A
import { readFile, writeFile } from "node:fs/promises";
import { $ } from "npm:zx";
import { temporaryDirectory, temporaryWrite } from "npm:tempy";
import process from "node:process";
import getAllFeatures from "./lib/getAllFeatures.ts";
import getFeatureManifest from "./lib/getFeatureManifest.ts";

const devcontainerCollection = {
  features: [] as any[],
};
const featureIds = await getAllFeatures(process.env.GITHUB_REPOSITORY!);
for (const id of featureIds) {
  const devcontainerFeature = await getFeatureManifest(
    `ghcr.io/${process.env.GITHUB_REPOSITORY}/${id}`
  );
  devcontainerCollection.features.push(devcontainerFeature);
}

const tempDirPath = temporaryDirectory();
process.chdir(tempDirPath);
$.cwd = process.cwd();

await writeFile(
  "devcontainer-collection.json",
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
const annotationsPath = temporaryWrite(JSON.stringify(annotations, null, 2), {
  suffix: ".json",
});

await $`tree -a`;

await $`oras push \
  ghcr.io/${process.env.GITHUB_REPOSITORY} \
  --config /dev/null:application/vnd.devcontainers \
  --annotation-file ${annotationsPath} \
  devcontainer-collection.json:application/vnd.devcontainers.collection.layer.v1+json`;
