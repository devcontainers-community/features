#!/bin/bash
set -e
source utils/ensure_apt_packages.sh
source utils/clear_local_apt_index.sh

ensure_apt_packages curl ca-certificates jq

if [[ -z $VERSION || $VERSION == latest ]]; then
  echo "🟪 Fetching latest LLVM release..."
  curl -fsSLo latest-release.json https://api.github.com/repos/llvm/llvm-project/releases/latest
  version=$(jq -r .tag_name latest-release.json | sed 's/^llvmorg-//')
  echo "🟦 Using latest LLVM release: v$version"
else
  version="$VERSION"
  echo "🟦 Using LLVM release: v$version"
fi

ensure_apt_packages lsb-release wget software-properties-common gnupg

echo "🟪 Installing LLVM v$version..."
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
./llvm.sh "$version"
echo "🟩 Installed LLVM v$version"

clear_local_apt_index
