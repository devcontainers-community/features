import { $ } from "npm:zx";

export default async function getFeatureManifest(image: string): Promise<any> {
  if (!image.endsWith(":latest")) {
    image += ":latest";
  }

  const imageManifest = JSON.parse(
    (await $`oras manifest fetch ${image}`).toString()
  );
  return JSON.parse(imageManifest.annotations["dev.containers.metadata"]);
}
