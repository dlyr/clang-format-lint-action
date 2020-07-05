#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

#/run-clang-format.py $*

touch "toto"
git config --global user.email "clang-formater@radium-engine.git"
git config --global user.name "clang-formatter"
git add toto
git commit -m"toto"
git push

