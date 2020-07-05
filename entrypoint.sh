#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

/run-clang-format.py $*

touch "toto"
git add toto
git commit -m"toto"
git push

