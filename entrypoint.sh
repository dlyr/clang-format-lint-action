#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

/run-clang-format.py $*

git config user.email "clang-formater@radium-engine.git"
git config user.name "clang-formatter"
git commit -a -m"*** clang-format only ***"
git push

