# Community Dev Container Features

🧰 Community-driven collection of addons for [@devcontainers]

<p align=center>
  <img src="https://github.com/devcontainers-community/features/assets/61068799/dc90e2b0-0ad7-4ca5-9315-29b245100444">
</p>

➕ Add extra features to your GitHub Codespace \
🐳 Use JSON, not Dockerfiles! \
👨‍👩‍👧‍👦 Community-driven maintainership

[![](https://img.shields.io/static/v1?style=for-the-badge&message=%F0%9F%A7%B0+Add+a+feature&color=CB3837&label=)](https://github.com/devcontainers-community/features/discussions/new?category=ideas)

<!-- prettier-ignore-start -->
<!-- START_FEATURE_LIST -->

- **[Dart](https://github.com/devcontainers-community/features-dart-sdk#readme)** - Install the Dart SDK
- **[CMake](https://github.com/devcontainers-community/features-cmake#readme)** - A feature to install CMake

<!-- END_FEATURE_LIST -->
<!-- prettier-ignore-end -->

## Usage

![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

To add any feature to your Dev Container, just add something like this to your
`devcontainer.json` file:

```jsonc
// devcontainer.json
{
  "features": {
    "ghcr.io/devcontainers-community/features/cmake": {},
    "ghcr.io/devcontainers-community/features/llvm": {},
    "ghcr.io/devcontainers-community/features/gcc": {}
  }
}
```

❓ Don't know what this ☝ means? Check out [this VS Code blog post].

Some features may have additional options that you can configure. 🛠️ For
example, the CMake feature lets you pin the version like this. Make sure you
check each feature's documentation for more information on what options are
available and what they do. 💻

```jsonc
// devcontainer.json
{
  "features": {
    "ghcr.io/devcontainers-community/features/cmake": { "version": "3.15.0" },
    "ghcr.io/devcontainers-community/features/gcc": { "version": "11.3.0" }
  }
}
```

## Development

![Deno](https://img.shields.io/static/v1?style=for-the-badge&message=Deno&color=000000&logo=Deno&logoColor=FFFFFF&label=)

This is just the **collection index** of all the features that we have. The
actual source code for each feature is housed in each feature's own repository.
🏠 Why do this? Because it makes it much easier to use a release-based workflow.

ℹ This magic index image is only really used by [containers.dev/features] and
other indexing tools. You can use Dev Container Features without an index just
fine.

To add a new feature, you can [open an Issue]. It'll probably result in some
kind of new repository being created (or [transferred] to us if you've already
coded it up) and you being granted unrestricted access to manage it how you see
fit. 🤗

If you want to become a Member of this organization, just [open an Issue] and
we'll get you set up. 🎉 We're very open to new people.

<!-- prettier-ignore-start -->
[this vs code blog post]: https://code.visualstudio.com/blogs/2022/09/15/dev-container-features
[@devcontainers]: https://github.com/devcontainers
[open an issue]: https://github.com/devcontainers-community/features/issues/new
[what's in-scope for this project]: https://github.com/devcontainers-community/features/blob/main/CONTRIBUTING.md
[transferred]: https://docs.github.com/en/github/administering-a-repository/transferring-a-repository
[containers.dev/features]: https://containers.dev/features
<!-- prettier-ignore-end -->
