# Github Classroom Helper Scripts

These scripts are designed to work alongside GitHub Classroom and Classroom assistant to provide extra functionality

## push_feedback.sh

This script allows you to specify a directory of repos downloaded by GitHub classroom and a file name (that you've created in each student's repo).
It will modify the remote URL to allow pushing using SSH keys (make sure you have one configured), add the file, commit, and push to each repo.
Make sure that you've placed the feedback in a file with a consistent filename (feedback.md, for example) in each repo, then run the script

```bash
./push_feedback.sh ~/Documents/grading/test-valgrind-09-03-2020-08-058-29 feedback.md
```

You may either want to have a passphraseless ssh key or be using an ssh agent when using this utility.
More information on this is available in GitHub's documentation on genertaing and using SSH keys.
