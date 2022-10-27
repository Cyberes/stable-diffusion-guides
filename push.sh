#!/bin/bash

cd "$GITHUB_WORKSPACE"
git add --all
if [[ -n $(git diff-index --exit-code --ignore-submodules HEAD) ]]; then
	git commit -m "[AUTO] Update guides"
	git push origin main
fi
