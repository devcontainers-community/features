<!-- markdownlint-disable MD041 MD033 -->

<div align="center">

[![Dart website](https://thum.io/get/width/800/crop/600/noanimate/https://dart.dev/)](https://dart.dev/)

</div>

> Dart is a client-optimized language for fast apps on any platform

&mdash; [Dart programming language | Dart]

This feature installs the Dart SDK.

🆘 If you're having trouble with this feature, [open a Discussion] or [open an
Issue]! We'd be happy to fix bugs! 🐛

## Supported platforms

`linux/amd64` and `linux/arm64` platforms `debian` and `ubuntu`.

## How to specify extensions?

This feature installs any version with the `version` option and `channel` option.
Check [Dart SDK archive] for channel details.

```json
"features": {
    "ghcr.io/devcontainers-community/features/dart:1": {
        "version": "3",
        "channel": "beta"
    }
}
```

Note that the beta and dev channels use suffix-based version matching,
so only versions ending with channel name (e.g. `3.1.0-63.1.beta`) can be installed.

<!-- prettier-ignore-start -->
[Dart programming language | Dart]: https://dart.dev/
[Dart SDK archive]: https://dart.dev/get-dart/archive
[open a Discussion]: https://github.com/devcontainers-community/features/discussions/new?category=q-a
[open an Issue]: https://github.com/devcontainers-community/features/issues/new
<!-- prettier-ignore-end -->
