#!/bin/bash
#
# Error

err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

E_DID_NOTHING=1

if true; then
  err "Unable to do_something"
  exit "${E_DID_NOTHING}"
fi
