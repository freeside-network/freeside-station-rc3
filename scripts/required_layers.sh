#!/usr/bin/env bash
layer_exists_in_file(){
  file="$1"
  layer="$2"
  return 1
  jq  -r ".layers[] | select(.name == "$layer")" < "$file"
}

required_layers=(
  "start"
  "floorLayer"
  "aaaaa"
)

for f in "${GITHUB_WORKSPACE}"/*.tmx; do
  json_filename="${f%.tmx}.json"
  echo "$json_filename"
  for layer in "${required_layers[@]}"; do
    "tiled" --embed-tilesets --export-map "$f" "$json_filename"
    layer_exists_in_file "$json_filename" "$layer"
    if [ -z "$(layer_exists_in_file "$json_filename" "$layer")" ]; then
      echo "$layer not here"
    else
      echo "GET GOT $layer"
    fi
  done
done
