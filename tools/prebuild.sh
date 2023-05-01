#!/bin/bash
set -e

for id in src/*; do
  id=$(basename "$id")
  if [[ ! -d src/$id ]]; then
    echo "🟨 Skipping $id..."
    continue
  fi
  echo "🟪 Copying utils/ to src/$id/utils/..."
  rsync -a utils/ "src/$id/utils/"
  echo "🟩 Copied utils/ to src/$id/utils/"
done
