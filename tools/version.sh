#!/bin/bash
# This script updates the version of a devcontainer-feature.json file located in
# the src folder. The version can either be incremented in major, minor, or
# patch levels or set to a specific version number. The jq command is used to
# manipulate the JSON data in the devcontainer-feature.json file.
#
# The jq commands used in this script are used to manipulate a JSON file located
# at src/$1/devcontainer-feature.json.
#
# The jq command is a command-line JSON processor that can filter, transform,
# and query JSON data. The syntax for the jq commands used in this script is as
# follows:
#
# 1.  The .version field is updated to a new value.
# 2.  The .version field is first transformed from a string to an array of
#     numbers by splitting it on the . character.
# 3.  Depending on the value of $2, different parts of the array are selected
#     and incremented by 1:
#     - If $2 is "major", then the first element (major version) is selected and
#       incremented by 1.
#     - If $2 is "minor", then the second element (minor version) is selected
#       and incremented by 1.
#     - If $2 is "patch", then the third element (patch version) is selected and
#       incremented by 1.
# 4.  The incremented values are concatenated back into a string using .
#     character.
# 5.  The resulting string is assigned back to the .version field.
#
# The output of the jq command is redirected to a temporary file, which is then
# moved over the original file to update it.
set -e

if [[ $2 == "major" ]]; then
  jq '.version = (.version | split(".") | .[0] | tonumber + 1) + ".0.0"' "src/$1/devcontainer-feature.json" > "src/$1/devcontainer-feature.json.tmp"
  mv "src/$1/devcontainer-feature.json.tmp" "src/$1/devcontainer-feature.json"
elif [[ $2 == "minor" ]]; then
  jq '.version = (.version | split(".") | .[0] + "." + .[1] | tonumber + 1) + ".0"' "src/$1/devcontainer-feature.json" > "src/$1/devcontainer-feature.json.tmp"
  mv "src/$1/devcontainer-feature.json.tmp" "src/$1/devcontainer-feature.json"
elif [[ $2 == "patch" ]]; then
  jq '.version = (.version | split(".") | .[0] + "." + .[1] + "." + .[2] | tonumber + 1)' "src/$1/devcontainer-feature.json" > "src/$1/devcontainer-feature.json.tmp"
  mv "src/$1/devcontainer-feature.json.tmp" "src/$1/devcontainer-feature.json"
else
  jq ".version = \"$2\"" "src/$1/devcontainer-feature.json" > "src/$1/devcontainer-feature.json.tmp"
  mv "src/$1/devcontainer-feature.json.tmp" "src/$1/devcontainer-feature.json"
fi
