#!/bin/bash
# check usage

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 path_to_repos feedback_filename <branch>"
  echo "Example: $0 ~/Documents/test-cra/test-valgrind-09-03-2020-08-058-29 feedback.md"
  echo "If you specify a branch, this script will switch to that branch and push it back to github"
fi

if [[ $# -eq 3 ]]; then
  feedback_branch=$3
fi

olddir=`pwd`

cd "$1" || echo "Repo directory doesn't exist; exiting" &&
pwd
# check to see if
cd `ls -d * | head -n 1`
git status > /dev/null || ( echo "Repo directory doesn't contain repositories; exiting" && cd $olddir && exit )
cd ..

for repo in `ls -d *`; do
  echo Providing Feedback: $repo
  cd $repo
  git remote set-url origin $(git remote -v |head -n 1 |grep -o 'github\.com.*git' | awk -F\/ '{print "git@"$1"/"$2":"$3}')
  [[ ! -z "$feedback_branch" ]] && git branch $feedback_branch
  [[ ! -z "$feedback_branch" ]] && git checkout $feedback_branch

  git add $2
  git commit -m 'Add feedback form'
  [[ ! -z "$feedback_branch" ]] && git push -u origin $feedback_branch || git push
  cd ..
done

cd $olddir
#branch check:
#[[ -z "$feedback_branch" ]]

#git remote -v |head -n 1 |grep -o 'github\.com.*git' | awk -F\/ '{print "git@"$1"/"$2":"$3}'
