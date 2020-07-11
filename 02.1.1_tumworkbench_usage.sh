# pwd
cd /home/rad/users/gaurav/projects/tbp

# Activate virtual environment
source venv/bin/activate

# Install django
pip install Django==2.2.1

########################################
# 1) Setup the empty project
########################################
# 1.1) Create the project
django-admin startproject tumworkbench
cd tumworkbench

# 1.2) Create superuser for admin
python manage.py createsuperuser
# Username (leave blank to use 'gjain'): gjain
# Email address: gaurav.jain@tum.de
# Password: gjain123456
# Password (again): gjain123456
# Superuser created successfully.

# 1.3) Template setting
# - Create a template folder and add base.html to it
# - Add a reference to its configuration class in the TEMPLATES settings (settings.py)

########################################
# 2) Setup the user login, logout and authentication
########################################
# 2.1) A new userinfo app
# - Create the "userinfo" app
# - To include the app in our project, we need to add a reference to 
#   its configuration class in the INSTALLED_APPS settings (settings.py).
django-admin startapp userinfo

# 2.2) Create a urls.py file in our events app (new file)



