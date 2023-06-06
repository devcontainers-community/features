#!/bin/bash
set -e
source dev-container-features-test-lib

check 'dart' dart --version

reportResults
