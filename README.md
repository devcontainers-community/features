<div align="center">

![🚧 Under construction 👷‍♂️](https://i.imgur.com/LEP2R3N.png)

</div>

# Features for [@devcontainers]

🧰 [@jcbhmr]'s collection of addons for [@devcontainers]

<div align="center">

![]()

</div>

💻 Works with [devcontainers] \
☁️ Works with [GitHub Codespaces] \
⚠️ I only officially support [Debian]-based images

👀 Don't see your feature here? [Add it yourself] or [open an Issue]!

## Usage

![VS Code](https://img.shields.io/static/v1?style=for-the-badge&message=VS+Code&color=007ACC&logo=Visual+Studio+Code&logoColor=FFFFFF&label=)
![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

📄 [Complete feature list]

Just add a `.devcontainer/devcontainer.json` file with a `features` key. It's
very similar to `package.json`'s `dependencies` object, just with the addition
of an `options` object.

📚 Make sure to inspect each feature for feature-specific options!

```json
{
  "image": "mcr.microsoft.com/devcontainers/universal",
  "features": {
    "ghcr.io/jcbhmr/devcontainer-features/deno:": {},
    "ghcr.io/jcbhmr/devcontainer-features/haskell": {}
  }
}
```

Then, after adding your devcontainer config file, you can open it in GitHub
Codespaces, or [open it locally using VS Code]. Be warned some features will
compile things from source and may take a while!

<div align="center">

![](https://i.imgur.com/JMdowst.png)

</div>

## Development

![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)
![JSON](https://img.shields.io/static/v1?style=for-the-badge&message=JSON&color=000000&logo=JSON&logoColor=FFFFFF&label=)
![Bash](https://img.shields.io/static/v1?style=for-the-badge&message=Bash&color=4EAA25&logo=GNU+Bash&logoColor=FFFFFF&label=)

➕ Looking to add a new feature? Check out the [contributing guide]!

This project uses a devcontainer config to outline the development environment.
We also provide various VS Code customizations for your coding pleasure.

To get started, create a GitHub Codespace on a copy of this repository. From
there, the [dev wiki] provides information about adding features, layout,
conventions, etc. When or if you want to contribute your changes back to this
repository, you can follow the [contributing guide]. Happy coding! 👋

🗺️ If you're looking for a more thorough outline of how this repo works, check
out the [How it works] page on the dev wiki.

<!-- prettier-ignore-start -->
[@jcbhmr]: https://github.com/jcbhmr
[@devcontainers]: https://github.com/devcontainers
[add it yourself]: #
[open an issue]: https://github.com/jcbhmr/devcontainer-features/issues/new
[complete feature list]: https://jcbhmr.github.io/devcontainer-features/
[debian]: https://hub.docker.com/_/debian
[open it locally using vs code]: https://code.visualstudio.com/docs/devcontainers/containers#_quick-start-open-an-existing-folder-in-a-container
[contributing guide]: #CONTRIBUTING.md
[how it works]: https://github.com/jcbhmr/devcontainer-features/wiki
[dev wiki]: https://github.com/jcbhmr/devcontainer-features/wiki
[devcontainers]: https://containers.dev/
[github codespaces]: https://github.com/features/codespaces
<!-- prettier-ignore-end -->
