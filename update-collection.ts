#!/usr/bin/env -S deno run -A
import { copyFile, readFile, writeFile } from "node:fs/promises";
import { $ } from "npm:zx";
import { temporaryDirectory, temporaryWrite } from "npm:tempy";
import process from "node:process";
import { join } from "node:path";

async function getAllFeatures(repo: string): Promise<string[]> {
  const [owner, name] = repo.split("/");
  const url = new URL("https://github.com/search");
  url.searchParams.set(
    "q",
    `owner:${owner} /${name}\\/.+/ package_type:container`
  );
  url.searchParams.set("type", "registrypackages");
  url.searchParams.set("p", "1");
  const response = await fetch(url);
  return (await response.json()).payload.results
    .map((x) => x.name)
    .filter((f) => f !== "features")
    .map((f) => f.split("/")[1]);
}

async function getFeatureManifest(image: string): Promise<any> {
  if (!image.endsWith(":latest")) {
    image += ":latest";
  }

  const imageManifest = JSON.parse(
    (await $`oras manifest fetch ${image}`).toString()
  );
  return JSON.parse(imageManifest.annotations["dev.containers.metadata"]);
}

const devcontainerCollection = {
  sourceInformation: {
    source: "devcontainer-cli",
  },
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
const annotationsPath = await temporaryWrite(
  JSON.stringify(annotations, null, 2),
  { suffix: ".json" }
);

await $`tree -a`;

await $`oras push \
  ghcr.io/${process.env.GITHUB_REPOSITORY}:latest \
  --config /dev/null:application/vnd.devcontainers \
  --annotation-file ${annotationsPath} \
  devcontainer-collection.json:application/vnd.devcontainers.collection.layer.v1+json`;
