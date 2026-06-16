#!/bin/sh

docker build -t dedelala/cvprint:latest . || exit 1

docker run -it --rm -v "$PWD:/cv" -w /cv dedelala/cvprint:latest
