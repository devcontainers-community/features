#!/usr/bin/env bash

VERSION=${VERSION:-"latest"}

DART_SDK="/usr/lib/dart"

set -e
source _common.sh

if [ "$(id -u)" -ne 0 ]; then
  echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
  exit 1
fi

architecture="$(dpkg --print-architecture)"
if [ "${architecture}" != "amd64" ] && [ "${architecture}" != "arm64" ]; then
  echo "(!) Architecture $architecture unsupported"
  exit 1
fi

# Clean up
rm -rf /var/lib/apt/lists/*

export DEBIAN_FRONTEND=noninteractive

check_packages curl ca-certificates unzip

case "$architecture" in
amd64)
  SDK_ARCH="x64"
  ;;
arm64)
  SDK_ARCH="arm64"
  ;;
esac

if [ "${VERSION}" = "latest" ]; then
  URL="https://storage.googleapis.com/dart-archive/channels/be/raw/latest/sdk/dartsdk-linux-${SDK_ARCH}-release.zip"
fi

echo "Downloading Dart..."

mkdir "${DART_SDK}"

# Working directory
mkdir /tmp/dvcf-dart
pushd /tmp/dvcf-dart

curl -sL "${URL}" -o dart.zip
unzip -q dart.zip
mv dart-sdk/* "${DART_SDK}"/.

popd
rm -rf /tmp/dvcf-dart

# Clean up
rm -rf /var/lib/apt/lists/*

echo "Done!"
