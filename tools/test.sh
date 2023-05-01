#!/bin/bash
set -e

tools/prebuild.sh
devcontainer features test "$@"
