#!/bin/bash

case $OSTYPE in
darwin*)
  OPTIONS=--platform=linux/x86_64
  ;;
*)
  OPTIONS=
  ;;
esac

docker run -it --rm $OPTIONS --privileged -e DISPLAY=host.docker.internal:0 fiddlerdocker:latest
