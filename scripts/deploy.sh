#!/bin/bash
for f in *.tmx; do
  tiled --embed-tilesets --export-map "$f" "${f%.tmx}.json"
done

scp -r ./*.json ./oc-tiles ./ss13-icons freesidestn@freeside.network
