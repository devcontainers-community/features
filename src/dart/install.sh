#!/usr/bin/env bash

VERSION=${VERSION:-"latest"}
CHANNEL=${CHANNEL:-"stable"}

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

find_version_from_git_tags() {
    local variable_name=$1
    local requested_version=${!variable_name}
    if [ "${requested_version}" = "none" ]; then return; fi
    local repository=$2
    local prefix=${3:-"tags/v"}
    local separator=${4:-"."}
    local last_part_optional=${5:-"false"}
    if [ "$(echo "${requested_version}" | grep -o "." | wc -l)" != "2" ]; then
        local escaped_separator=${separator//./\\.}
        local last_part
        if [ "${last_part_optional}" != "false" ]; then
            last_part="(${escaped_separator}[0-9]+)*.*${last_part_optional}"
        else
            last_part="${escaped_separator}[0-9]+"
        fi
        local regex="${prefix}\\K[0-9]+${escaped_separator}[0-9]+${last_part}$"
        local version_list
        check_git
        check_packages ca-certificates
        version_list="$(git ls-remote --tags "${repository}" | grep -oP "${regex}" | tr -d ' ' | tr "${separator}" "." | sort -rV)"
        if [ "${requested_version}" = "latest" ] || [ "${requested_version}" = "current" ] || [ "${requested_version}" = "lts" ]; then
            declare -g "${variable_name}"="$(echo "${version_list}" | head -n 1)"
        else
            set +e
            declare -g "${variable_name}"="$(echo "${version_list}" | grep -E -m 1 "^${requested_version//./\\.}([\\.\\s]|$)")"
            set -e
        fi
    fi
    if [ -z "${!variable_name}" ] || ! echo "${version_list}" | grep "^${!variable_name//./\\.}$" >/dev/null 2>&1; then
        echo -e "Invalid ${variable_name} value: ${requested_version}\nValid values:\n${version_list}" >&2
        exit 1
    fi
    echo "${variable_name}=${!variable_name}"
}

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

if [ "${CHANNEL}" = "main" ]; then
    URL="https://storage.googleapis.com/dart-archive/channels/be/raw/latest/sdk/dartsdk-linux-${SDK_ARCH}-release.zip"
else
    if [ "${CHANNEL}" = "stable" ]; then
        LAST_PART="false"
    elif [ "${CHANNEL}" = "beta" ]; then
        LAST_PART="beta"
    elif [ "${CHANNEL}" = "dev" ]; then
        LAST_PART="dev"
    else
        echo "(!) Channel ${CHANNEL} unsupported"
        exit 1
    fi
    # Soft version matching
    find_version_from_git_tags VERSION "https://github.com/dart-lang/sdk" "tags/v" "." "${LAST_PART}"

    URL="https://storage.googleapis.com/dart-archive/channels/${CHANNEL}/release/${VERSION}/sdk/dartsdk-linux-${SDK_ARCH}-release.zip"
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
