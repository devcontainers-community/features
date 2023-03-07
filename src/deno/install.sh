#!/bin/bash
# 👮‍♂️ Official install instructions from Installation | Manual | Deno [1]:
#
#   curl -fsSL https://deno.land/x/install/install.sh | sh
#
# We want to use this install.sh script, but we also want to do a bit of prep
# work to make sure that we a) have all the dependencies we need, b) that we are
# installing Deno to the right spot, and c) that we get any permissions right.
#
# To do this, we will:
#
# 1. Install curl if not already installed.
# 2. Install unzip if not already installed.
# 3. curl | sh the install script to install to /deno.
# 4. chown the /deno directory to the $_REMOTE_USER.
# 5. Add env vars to the $_REMOTE_USER shell profile.
#
# This install.sh script also takes inspiration from a Dockerfile snippet from
# btholt/deno-dev-container-example [2]:
#
#   ENV DENO_INSTALL=/deno
#   RUN mkdir -p /deno \
#     && curl -fsSL https://deno.land/x/install/install.sh | sh \
#     && chown -R vscode /deno
#   ENV PATH=${DENO_INSTALL}/bin:${PATH} \
#     DENO_DIR=${DENO_INSTALL}/.cache/deno
#
# [1]: https://deno.land/manual/getting_started/installation
# [2]: https://github.com/btholt/deno-dev-container-example/blob/main/.devcontainer/Dockerfile
set -e
source bash_modules/ensure_curl.sh
source bash_modules/ensure_unzip.sh
source bash_modules/add_env.sh

# 1. Install curl if not already installed.
ensure_curl

# 2. Install unzip if not already installed.
ensure_unzip

# 3. curl | sh the install script to install to /deno. We use the $VERSION
#    from the devcontainer-feature.json config. This is direct from the Deno
#    install script. We use DENO_INSTALL to set the install path.
if [[ $VERSION == "latest" ]]; then
  export DENO_INSTALL=/deno
  curl -fsSL https://deno.land/x/install/install.sh | sh
else
  export DENO_INSTALL=/deno
  curl -fsSL https://deno.land/x/install/install.sh | sh -s "v$VERSION"
fi

# 4. chown the /deno directory to the $_REMOTE_USER.
chown -R "$_REMOTE_USER" /deno

# 5. Add env vars to the $_REMOTE_USER shell profile.
add_env 'DENO_INSTALL=/deno'
add_env 'PATH="$DENO_INSTALL/bin:$PATH"'
