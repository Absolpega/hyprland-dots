#!/bin/sh

grep -v '^$' "$(dirname "$0")/deps.txt" | paru --needed -S -
