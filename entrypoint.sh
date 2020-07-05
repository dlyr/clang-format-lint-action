#!/bin/sh -l

cd "$GITHUB_WORKSPACE"


echo "$GITHUB_REF"
git log --pretty=oneline -1



#echo "### Adding git remote..."
#git remote add origin https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git

echo "### Getting branch"
BRANCH=${GITHUB_REF#*refs/heads/}
echo "### git fetch $BRANCH ..."
git fetch origin $BRANCH
echo "### Branch: $BRANCH (ref: $GITHUB_REF )"
git checkout $BRANCH

echo "## Configuring git author..."
git config user.email "clang-formater@radium-engine.git"
git config user.name "clang-formatter"

# Ignore workflow files (we may not touch them)
git update-index --assume-unchanged .github/workflows/*

echo "## Running clang-format on C/C++ source"

/run-clang-format.py $*

echo "## Commiting files..."
git commit -a -m"*** clang-format only ***" || true

echo "## Pushing to $BRANCH"
git push -u origin $BRANCH
