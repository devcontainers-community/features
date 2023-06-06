![🚧 Under construction 👷‍♂️](https://i.imgur.com/LEP2R3N.png)

# Devcontainer community features

🧰 Community-driven collection of addons for [@devcontainers]

<div align="center">

![](https://i.imgur.com/Gz9yWx8.png)

[Docs website](https://devcontainers-community.github.io/features/)
| [Official feature index](https://containers.dev/features)

</div>

➕ Add extra features to your GitHub Codespace \
🐳 Use JSON, not `Dockerfile`s! \
👨‍👩‍👧‍👦 Community-driven maintainership

## Usage

![JSON](https://img.shields.io/static/v1?style=for-the-badge&message=JSON&color=000000&logo=JSON&logoColor=FFFFFF&label=)
![GitHub Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=GitHub+Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

Add a `features: {}` key to your existing `devcontainer.json` file, or make a
new one at `.devcontainer/devcontainer.json` in your repository. Then, just add
[one of the features that we offer] to the object map with an optional `{}`
options object.

```jsonc
// .devcontainer/devcontainer.json
{
  "features": {
    "ghcr.io/devcontainers-community/features/dart": {}
  }
}
```

[📚 Read more about each feature on our documentation website!](https://devcontainers-community.github.io/features/)

<!-- prettier-ignore-start -->
[@devcontainers]: https://github.com/devcontainers
[one of the features that we offer]: https://devcontainers-community.github.io/features/
<!-- prettier-ignore-end -->
