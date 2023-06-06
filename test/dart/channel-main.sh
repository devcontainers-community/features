#!/usr/bin/env bash

set -e
source dev-container-features-test-lib

check 'dart' bash -c "dart --version"

reportResults
