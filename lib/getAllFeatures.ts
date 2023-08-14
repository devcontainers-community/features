export default async function getAllFeatures(repo: string): Promise<string[]> {
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
