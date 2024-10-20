#!/bin/sh

# Generate Dockerfile for each tag using its Dockerfile.template

tags_glob="$(realpath $(dirname "$(dirname "$0")"))/tags/*/"
for dir in ; do
    path=$(realpath $dir)
    tag=$(basename $dir)
    rm -f "$path/Dockerfile"
    cp "$path/Dockerfile.template" "$path/Dockerfile"
done