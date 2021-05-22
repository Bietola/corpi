#!/bin/sh

usage() {
  echo "Usage: 1.haskell.vim"

  exit 1
}

[ $# -ne 0 ] && usage

ROOT=/home/dincio/corpi
cd "$ROOT/bin"

# Recipe
./corpi -n 1
./recs -n 22 | ./1.proc

cd - >/dev/null
