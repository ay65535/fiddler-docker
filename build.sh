#!/bin/bash

case $OSTYPE in
darwin*)
  OPTIONS=--platform=linux/x86_64
  ;;
*)
  OPTIONS=
  ;;
esac

docker build --pull --rm -f Dockerfile $OPTIONS -t fiddlerdocker:latest .
