#!/bin/sh

DIFF="git diff"
CP="rsync"

diff() {
	files=$(find . -type f -print)

	for file in $files; do
		command="$DIFF $file ~/$file"
		echo "$command"
		sh -c "$command"
	done
}

push() {
	echo "push placeholder"
}

pull() {
	echo "pull placeholder"
}

[ "$1" == "diff" ] && diff
[ "$1" == "push" ] && push
[ "$1" == "pull" ] && pull

