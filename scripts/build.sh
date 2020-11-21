#!/bin/bash
for f in ${GITHUB_WORKSPACE}/*.tmx; do
  xvfb-run "$HOME/tiled" --embed-tilesets --export-map "$f" "${f%.tmx}.json"
done

cat ${GITHUB_WORKSPACE}/*.json | jq -r '.tilesets[].image' | sort -u > images_to_sync

cat images_to_sync

# Sync main files
rsync -Pav -e "ssh -o 'StrictHostKeyChecking=no' -i $SSH_KEY_PATH" ${GITHUB_WORKSPACE}/*.json freesidestn@freeside.network:

# And sync matched resources
rsync -Pav -e "ssh -o 'StrictHostKeyChecking=no' -i $SSH_KEY_PATH" --files-from=images_to_sync . freesidestn@freeside.network:
