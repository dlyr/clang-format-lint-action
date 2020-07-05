#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

#/run-clang-format.py $*

touch "toto"
git config user.email "clang-formater@radium-engine.git"
git config  user.name "clang-formatter"
git add toto
git commit -m"toto"
git push

