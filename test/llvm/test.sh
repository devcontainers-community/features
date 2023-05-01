#!/bin/bash
set -e
source dev-container-features-test-lib

check 'Clang exists' clang --version
check 'Clang-Format exists' clang-format --version

reportResults
