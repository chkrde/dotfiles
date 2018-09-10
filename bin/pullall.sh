#!/bin/bash
#
# find git folders and pull
#

DIRS=("${HOME}/go/src/")

echo "Updating git repos..."

for DIR in ${DIRS[@]};
do
	REPOS=$(find ${DIR} -name ".git")
	for REPO in ${REPOS[@]};
	do
		echo "# Checking ${REPO//.git/""}"
		cd ${REPO//.git/""}
		LC_ALL=C git pull 2>&1 | sed 's/^/  /' 
	done
done

cd ~
/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME} submodule update --init --remote

