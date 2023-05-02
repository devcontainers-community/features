## FAQ

### What qualifies as a feature?

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
