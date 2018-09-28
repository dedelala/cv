#!/bin/sh

docker run -it --rm -v "$PWD:/cv" -w /cv \
  dedelala/word header.md cv.md footer.md
