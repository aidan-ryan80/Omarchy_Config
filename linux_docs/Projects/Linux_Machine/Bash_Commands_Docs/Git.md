##### Switching old branch name to new branch name
```bash
git fetch origin
git branch -m tech/transform_files tech/etl_pipeline
git branch -u origin/tech/etl_pipeline tech/etl_pipeline
```
##### Switching origin link to new username
```bash
git fetch -v
```
##### Updating the origin url
```bash
git remote set-url origin https://github.com/aidan-ryan80/repo_name
```
##### List tracked files:
```bash
git ls-files
```