#!/bin/bash
set -e
source dev-container-features-test-lib

check version deno --version
check welcome deno run https://deno.land/std/examples/welcome.ts
reportResults
