#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

/run-clang-format.py $*
echo "$GITHUB_REF"
git log --pretty=oneline -1
git config user.email "clang-formater@radium-engine.git"
git config user.name "clang-formatter"
git commit -a -m"*** clang-format only ***"
git push "$GITHUB_REF"
