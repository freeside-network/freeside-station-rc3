#!/bin/bash
for f in ${GITHUB_WORKSPACE}/*.tmx; do
  xvfb-run "$HOME/tiled" --embed-tilesets --export-map "$f" "${f%.tmx}.json"
done

rsync -Pav -e "ssh -o 'StrictHostKeyChecking=no' -i $SSH_KEY_PATH" ${GITHUB_WORKSPACE}/*.json ${GITHUB_WORKSPACE}/oc-tiles ${GITHUB_WORKSPACE}/ss13-icons freesidestn@freeside.network:www/
