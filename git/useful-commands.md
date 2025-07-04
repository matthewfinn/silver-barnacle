### Merge master into feature branch 
```bash
git pull
git merge origin master
git status
```


### Remove cache to re-apply a .gitignore file
```bash
git rm -r --cached .
git add .
git commit -m "Commit message"
```
### Undo a commit but keep the changes in your working directory, you can use the following command:
```shell
git reset --soft HEAD~1
```

### Undo a commit & reset changes
```shell
git reset HEAD~1
```

### Detailed diff of all changes:
```shell
git diff HEAD
```

### Line Endings warning
```shell
git config --global core.autocrlf true
```

**true**: Git will convert CRLF to LF when committing, and LF to CRLF when checking out.
**input**: Git will convert CRLF to LF when committing, but it won't modify line endings when checking out files.

### Git Post-Commit hook execute script instructions
1. Open the Git hooks directory:
```shell
cd your-repo/.git/hooks
```
2. Create/Edit `post-commit` hook
```shell
echo post-commit
```
3. Add the below script
```shell
#!/bin/sh

# Get the latest commit message
latest_commit_message=$(git log -1 --pretty=%B)

# Check if the commit message already contains the " - amended by TOC script" suffix
if echo "$latest_commit_message" | grep -q " - amended by TOC script"; then
    echo "Commit already amended by TOC script. Exiting to prevent infinite loop."
    exit 0
fi

# Run the node script to generate the TOC
[Run a script or something, example below that generates a markdown file with a table of contents]
node istqb-ctfl-2025/generate_toc.js

# Add all changes to the staging area
git add .

# Amend the commit without changing the commit message, but add " - amended by TOC script" to prevent looping
git commit --amend --no-edit -m "$(git log -1 --pretty=%B) - amended by TOC script"
```
### Remove URLs
```shell
git remote -v 
git remote set-url origin git@github.com:your-username/your-repo.git

git remote set-url origin git@github.com:matthewfinn/interviews.git

```
