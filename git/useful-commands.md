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

### Undo a commit
```shell
git reset --soft HEAD~1
```g