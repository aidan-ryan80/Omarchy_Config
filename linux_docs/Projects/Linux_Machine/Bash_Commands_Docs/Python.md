##### Activating Python Virtual Environment
```bash
source .venv/bin/activate
```
##### Installing all necessary packages in venv with requirements.txt
```bash
pip install -r requirements.txt
```
##### Updating requirements.txt manually with required packages
```bash
pip freeze > requirements.txt
```
##### Use pip-tools to sync requirements.txt with packages used a project
- This uninstalls packages not used in the project or not in the requirements.txt anymore
```bash
pip install pip-tools
pip-sync requirements.txt
```
##### Commands from Denis for Supabase Postgresql DB
```bash
flask db init - use this message if you delete the migrations folder entirely.
flask db migrate -m "{your message}" - to create a migration
flask db upgrade - commit the migration
```