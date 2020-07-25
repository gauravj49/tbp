# pwd
cd /home/rad/users/gaurav/projects/tbp

# Help: https://github.com/codingforentrepreneurs/Try-Django-2.2

# The name of this project is called 'Condor'

########################################
# 1) Setup the system: Create Virtual Environment & Install Django
########################################
# Source: https://www.codingforentrepreneurs.com/blog/create-a-blank-django-project
# Source: https://www.youtube.com/watch?v=-oQvMHpKkms

# 1.1) Create Dev Directory for General Project Storage
cd /home/rad/users/gaurav/projects/tbp
# 1.2) Create Project Directory
mkdir condor && cd condor
# 1.3) Create Virtual Environment with Pipenv
pipenv install django==2.2.14
# 1.4) Activate Pipenv Shell
pipenv shell

########################################
# 2) Setup the empty project
########################################

# 2.1) Create the directory called 'src' where the django project is going to be stored
# NOTE: The dot (.) is important at the end of django-admin startproject condor . command
mkdir src && cd src
django-admin startproject condor .
# (condor) gjain@GauravPC:/mnt/c/Users/Gaurav/bin/projects/tbp/condor/src$ tree
# .
# ├── condor
# │   ├── __init__.py
# │   ├── settings.py
# │   ├── urls.py
# │   └── wsgi.py
# └── manage.py

# 2.2) Create requirements.txt file
pip freeze > requirements.txt

# 2.3) Some other common installations (optional):
pipenv install mysqlclient #python3
pipenv install django-crispy-forms
pip install django-widget-tweaks
pipenv install pillow

# 2.4) Run Migration
python manage.py migrate

# 2.5) Create superuser for admin
python manage.py createsuperuser
# Username (leave blank to use 'gjain'): gjain
# Email address: gaurav.jain@tum.de
# Password: gjain123456
# Password (again): gjain123456
# Superuser created successfully.

# 2.6) Template setting
# - Create a template folder and add index.html to it
#   - This will act as the entry point to the webtool
#   - From here we can links to many apps but most important one is
#     for the user_management app (login, signup, change/reset password and logout)
# - Add a reference to its configuration class in the TEMPLATES settings (settings.py)

########################################
# 2) User defined Apps
########################################
# https://stackoverflow.com/questions/10313475/moving-django-apps-into-subfolder-and-url-py-error
# 2.1) Create an apps folder that will store all the apps
mkdir -p apps/user_management

# 2.2) A new user_management app
# - Create the "user_management" app
# - Setup the user login, logout and authentication
# - To include the app in our project, we need to add a reference to 
#   its configuration class in the INSTALLED_APPS settings (settings.py).
python manage.py startapp user_management apps/user_management
# (condor) gjain@GauravPC:/mnt/c/Users/Gaurav/bin/projects/tbp/condor/src$ tree 
# .
# ├── apps
# │   └── user_management
# │       ├── __init__.py
# │       ├── admin.py
# │       ├── apps.py
# │       ├── migrations
# │       │   └── __init__.py
# │       ├── models.py
# │       ├── tests.py
# │       └── views.py
# ├── condor
# │   ├── __init__.py
# │   ├── settings.py
# │   ├── urls.py
# │   └── wsgi.py
# ├── db.sqlite3
# ├── manage.py
# ├── requirements.txt
# └── templates

# 2.2) Create a urls.py file in our events app (new file)

# 2.3) Render different template when user logged in or not logged in
# http://www.learningaboutelectronics.com/Articles/How-to-render-different-templates-based-on-a-condition-in-Django.php

# 2.4) Managing static files for multiple apps in Django
# https://overiq.com/django-1-11/handling-static-content-in-django/#static-files-configuration
# https://stackoverflow.com/questions/7192367/managing-static-files-for-multiple-apps-in-django