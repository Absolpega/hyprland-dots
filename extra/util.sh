#!/bin/sh

DIFF="git diff"
CP="rsync"

is_diff() {
	$DIFF --quiet $1 ~/$1
}

diff() {
	cd $2
	files=$(find . -type f -print)

	for file in $files; do
		(
			set -x
			$DIFF $file ~/$file
		)
	done
}

diffs() {
	cd $2
	files=$(find . -type f -print)

	for file in $files; do
		is_diff "$file" || echo "$file      ~/$file"
	done
}

push() {
	cd $2
	files=$(find . -type f -print)

	for file in $files; do
		is_diff "$file" || (
			set -x
			cp ~/"$file" "$file"
		)
	done
}

pull() {
	cd $2
	files=$(find . -type f -print)

	for file in $files; do
		is_diff "$file" || (
			set -x
			cp "$file" ~/"$file"
		)
	done
}

case "$1" in
diff)
	diff "$@"
	;;
diffs)
	diffs "$@"
	;;
push)
	push "$@"
	;;
pull)
	pull "$@"
	;;
*)
	echo "$1 is not a command"
	;;
esac
