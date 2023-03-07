> Meet Deno
>
> The easiest, \
> most secure JavaScript runtime.

&mdash; [Deno — A modern runtime for JavaScript and TypeScript]

> Deno (/ˈdiːnoʊ/, pronounced dee-no) is a JavaScript, TypeScript, and
> WebAssembly runtime with secure defaults and a great developer experience.
>
> It's built on V8, Rust, and Tokio.

&mdash; [Introduction | Manual | Deno]

Installs the latest version (or your custom version) of Deno to `/deno` and adds
`/deno/bin` to your `$PATH`.

🧩 This feature also installs the `deno` extension for VS Code **but does not
enable it**. You can enable it by adding the following to your
`.vscode/settings.json`, or adding it to your devcontainer customizations:

```jsonc
// .vscode/settings.json
{ "deno.enable": true }
```

```jsonc
// .devcontainer/devcontainer.json
{
  "customizations": {
    "vscode": {
      "settings": { "deno.enable": true }
    }
  }
}
```

## Further reading

- [Deno - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=denoland.vscode-deno)
- [First Steps | Manual | Deno](https://deno.land/manual/getting_started/first_steps)

<!-- prettier-ignore-start -->
[introduction | manual | deno]: https://deno.land/manual/introduction
[deno — a modern runtime for javascript and typescript]: https://deno.land/
<!-- prettier-ignore-end -->
