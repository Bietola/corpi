#!/bin/sh

usage() {
  echo "Usage: 1.haskell.vim"

  exit 1
}

[ $# -ne 0 ] && usage

ROOT=/home/dincio/corpi
bin="$ROOT/bin"

# Recipe
$bin/cat-recs -t haskell | $bin/1.proc
