#!/usr/bin/env bash
# scan.sh - build and security scan the spotify image

set -euo pipefail

IMAGE="spotify-clone:v3"
echo "Building image: $IMAGE"
docker build -t "$IMAGE" .

echo "Scanning $IMAGE (High & Critical)"
trivy image --severity HIGH,CRITICAL "$IMAGE"
echo "Done"
