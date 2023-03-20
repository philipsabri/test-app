#!/bin/bash
#git diff --name-only da90a1eba21a60503c88f201724c17b0e04cb3d7 HEAD # Ska trigga docker build
#.github/workflows/deployment.yaml
#deployment/values-dev.yaml
#pages/index.js
#
#git diff --name-only 4145b987a959d34114a2379a3610a2584788d497 HEAD # Ska inte trigga docker build
#deployment/values-dev.yaml
#

CHANGED_FILES=$(git diff --name-only da90a1eba21a60503c88f201724c17b0e04cb3d7 HEAD)
echo "$CHANGED_FILES" # For debugging purposes
for file in $CHANGED_FILES; do
  if !(echo "$file" | grep -q "^deployment/"); then
    echo "changes made outside deployment"
    echo "::set-output name=docker::true"
  fi
done
