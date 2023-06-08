#!/bin/sh

#$(find . -type f -print | sed -e 's/^/~\//')

files=$(find . -type f -print)

for file in $files; do
	command="git diff $file ~/$file"
	echo "$command"
	sh -c "$command"
done
