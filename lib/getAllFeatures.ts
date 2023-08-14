import { DOMParser } from "https://deno.land/x/deno_dom/deno-dom-wasm.ts";

export default async function getAllFeatures(owner: string): Promise<string[]> {
  const allFeatures: string[] = [];
  const url = new URL("https://github.com/search");
  url.searchParams.set(
    "q",
    `owner:${owner} /features\\/.+/ package_type:container`
  );
  url.searchParams.set("type", "registrypackages");
  url.searchParams.set("p", "1");
  while (true) {
    const response = await fetch(url);
    const html = await response.text();

    const document = new DOMParser().parseFromString(html, "text/html")!;
    const $ = (x: string) => document.querySelector(x);
    const $$ = (x: string) => [...document.querySelector(x)];

    const features = $$("[data-testid='results-list'] .search-title").map(
      (x) => x.innerText
    );
    allFeatures.push(...features);

    const nextButton = $("a[rel='next']");
    if (!nextButton) {
      break;
    }
    const p = parseInt(url.searchParams.get("p")!);
    url.searchParams.set("p", (p + 1).toString());
  }
  return allFeatures
    .filter((f) => f !== "features")
    .map((f) => f.split("/")[1]);
}
