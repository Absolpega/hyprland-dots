#!/bin/sh

#$(find . -type f -print | sed -e 's/^/~\//')

files=$(find . -type f -print)

for file in $files; do
	echo "git diff $file ~/$file"
	sh -c "git diff $file ~/$file"
done
