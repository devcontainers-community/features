#!/bin/bash
set -e
source dev-container-features-test-lib

check 'dart' /usr/lib/dart/bin/dart --version

reportResults
