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

**🤝 We want you!** If you're a community devcontainer feature maintainer, we'd
love to add you to this project! ❤️ If you just want to hand off a devcontainer
feature that you no longer want to maintain, **that's perfect too**. Open a
[Discussion] and let's have a friendly chat. 😊

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

## Development

![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)
![Bash](https://img.shields.io/static/v1?style=for-the-badge&message=Bash&color=4EAA25&logo=GNU+Bash&logoColor=FFFFFF&label=)

🐣 The @devcontainers-community organization is still in its early stages. This
features repository is currently trying to **hit the highlights first**. That
means popular features first! If you notice a bug 🐛 or have an improvement
suggestion 💡 we'd love to hear it! 😍

If you're interested in getting started modifying, adding, or testing a template
in this repository, you can do so without even leaving your browser thanks to
GitHub Codespaces! ☁️ After optionally forking the repository, you just hit the
green Code button at the top of the GitHub web UI and then Create codespace on
main. 🚀

After launching your dev environment and making some changes, you're probably
going to want to test those changes. Run the `devcontainer features test`
command to run _all_ the tests, or just `-f` to run a specific one that you're
working on. Be warned that this involves some heavyweight Docker-ing around!

```sh
devcontainer features test
```

🤝 Check out our contributing guide to see how to get your changes merged!

<!-- prettier-ignore-start -->
[@devcontainers]: https://github.com/devcontainers
[one of the features that we offer]: https://devcontainers-community.github.io/features/
[Discussion]: https://github.com/devcontainers-community/features/discussions/new?category=general
<!-- prettier-ignore-end -->
