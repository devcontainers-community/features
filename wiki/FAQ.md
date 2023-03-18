## What qualifies as a feature?

Features are generally medium-to-large blocks of software that are tooling for a
particular ecosystem. Things like programming languages ([Deno], [C++],
[Haskell], [Julia]) with their popular associated tooling ([pnpm], [Poetry],
[CMake], [Gradle]), and popular standalone tools ([MySQL], [Emscripten], [act],
[Terraform]) are good examples of things that are features. Things that aren't
features are things like package manager items ([TypeScript], [TensorFlow],
[Prettier]) or languages that don't have enough users ([esolangs]).

A good rule of thumb 👍 is that if it's **installed locally**
(project-specific), it's probably **not a feature**. If it's **global**, it
**might be worth a feature**. If you're in doubt, [pose your idea in a new
Discussion]! 💡

If you'd like to check whether or not your feature already exists, check out the
[official @devcontainers community feature index].
