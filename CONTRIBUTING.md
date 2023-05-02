**Thanks for taking the time to contribute! ❤️**

All types of contributions are encouraged and valued, no matter if it's a bug
report 🐛, a feature request 💡, or a Pull Request 🚀.

- **❓ I have a question:** [Open a Q&A Discussion]
- **🐛 I found a bug:** [Open an Issue]
- **💡 I have an idea:** [Open an Idea Discussion]
- **💻 I want to code:** See below

## Contributing code

1. 🔀 Fork the repo
2. 💻 Open the repo in your editor
3. 👨‍💻 Add your changes to your workspace
4. ✨ Run the tests to make sure everything works
5. 🔖 Commit & push your changes
6. 🔁 Open a PR to get your changes merged
7. 🚀 Profit!

👩‍⚖️ When contributing code to this project, you must agree that you have authored
100% of the content, that you have the necessary rights to the content and that
the content you contribute may be provided under the project license.

## Conventions & linting

This repository is sort-of like a monorepo. We use a monorepo commit convention
where the PR title becomes the commit message of a single squashed commit when
merged with the `main` branch.

This means that your PR should at least _try_ to conform to the conventional
commits format. Usually that means something like "feat(deno): make it work on
M1 Macs". But don't worry, it's OK if it doesn't. 🤷‍♂️ It just helps make the
commits easier to reason about when there's _so many subfolders_.

📚 Further reading: [Conventional Commits]

We also have set up [MegaLinter] for this project, so you should get a nice
linting report as a comment on your PR. Don't let it spook you! 🦇

_Originally discussed in [devcontainers-community#4]_

## What qualifies as a feature?

Features are generally medium-to-large blocks of software that are tooling for a
particular ecosystem. Things like programming languages ([Deno], [C++],
[Haskell], [Julia]) with their popular associated tooling ([pnpm], [Poetry],
[CMake], [Gradle]), and popular standalone tools ([MySQL], [Emscripten], [act],
[Terraform]) are good examples of things that are features. Things that aren't
features are things like package manager items ([TypeScript], [TensorFlow],
[Prettier]).

A good rule of thumb 👍 is that if it's **installed in a folder** or via a
**lang-chain dependency manager** (i.e. able to be installed per-project), it's
probably **not a feature**. If it's **global**, it might be **worth a feature**.
If you're in doubt, [pose your idea in a new Discussion]! 💡

If you'd like to check whether or not your feature already exists, check out the
[official @devcontainers community feature index].

<!-- prettier-ignore-start -->
[devcontainers-community#4]: https://github.com/orgs/devcontainers-community/discussions/4
[Conventional Commits]: https://www.conventionalcommits.org/en/v1.0.0/
[open a Q&A discussion]: https://github.com/devcontainers-community/templates/discussions/new?category=q-a
[open an idea discussion]: https://github.com/devcontainers-community/templates/discussions/new?category=ideas
[open an issue]: https://github.com/devcontainers-community/templates/issues/new
[megalinter]: https://megalinter.io/latest/
[Deno]: https://deno.com/
[C++]: https://en.cppreference.com/w/
[Haskell]: https://www.haskell.org/
[Julia]: https://julialang.org/
[pnpm]: https://pnpm.io/
[Poetry]: https://python-poetry.org/
[CMake]: https://cmake.org/
[Gradle]: https://gradle.org/
[MySQL]: https://www.mysql.com/
[Emscripten]: https://emscripten.org/
[act]: https://github.com/nektos/act
[Terraform]: https://www.terraform.io/
[TypeScript]: https://www.typescriptlang.org/
[TensorFlow]: https://www.tensorflow.org/
[Prettier]: https://prettier.io/
[pose your idea in a new Discussion]: https://github.com/devcontainers-community/features/discussions/new?category=ideas
[official @devcontainers community feature index]: https://containers.dev/collections
<!-- prettier-ignore-end -->
