# pwd
cd /home/rad/users/gaurav/projects/tbp

# Activate virtual environment
source venv/bin/activate

# Install django
pip install Django==2.2.1

# Create the project
django-admin startproject tumworkbench


# Source: https://blog.hlab.tech/lesson-3-a-step-by-step-guide-on-creating-custom-dashboard-and-login-user-in-django-2-2-and-python-3-7/

# Django admin
python manage.py createsuperuser
# Username (leave blank to use 'gjain'): gjain
# Email address: gaurav.jain@tum.de
# Password: gjain123456
# Password (again): gjain123456
# Superuser created successfully.

# Download bootstrap
# https://getbootstrap.com/docs/4.5/getting-started/download/
# or use CDN (cached version)

# Create the app
python manage.py startapp userinfo
# To include the app in our project, we need to add a reference to its configuration class in the INSTALLED_APPS settings (settings.py).

# Templates and Static files
# Create templates and static folder inside our userinfor app
# Create a template called base.html which all other templates will extend from. Inside the templates folder, create a file called base.html 
# base.html explanation:
#   # This file contains normal HTML code.
#   # Line 2, we use Django load static tag which builds URL for the given relative path using the configured STATICFILES_STRORAGE.
#   # Line 9, we include our bootstrap css.
#   # Line 17. We include jQuery.
#   # Line 18, we include bootstrap js.

# Using Django UserCreationForm
#   Django authentication provides a form named UserCreationForm which inherits from ModelForm class to handle the creation of new users. 
#   Add the code in  userinfo/views.py file
#   # Line 1 to 4 – we import the class we needed to register a new user.
#   # Line 7 to 19 – we create a function called sign_up which will handle our user registrations.
#   # Line 8, we check whether the request method is a post.
#   # Line 9 – we create an instance UserCreationForm
#   # Line 10 – we check whether the form is valid.
#   # Line 11 – we save the data in the form to our User model.
#   # Line 12 – we get the username from the form.
#   # Line 13 – we get the password from the form
#   # Line 14 – we pass the username and password to authenticate method provided to us by Django.
#   # Line 15 – we log in the user to the system.
#   # Line 16 – we return an HTTP response to let the user know that the user was created successfully. You can choose to redirect the user to their dashboard at this point.
#   # Line 17 – we do an else statement just to check if the request is get request.
#   # Line 18 – we create an empty UserCreationForm instance.
#   # Line 19 – we render the registration form to the user. We need to create the register.html file in template and make sure it has the following code:

# Description of register.html
# Line 1 – we extend our base template.
# Line 3 to 30 –  we use block content section defined in base.html to create a bootstrap form.
# Line 15 – we capture the username from the user.
# Line 19 – we ask for a password. Notice that the name is password1, UserCreationForm expects this otherwise it will not pass validation.
# Line 23 – we ask user confirm password. Notice that the name is password2, UserCreationForm expects this otherwise it will not pass validation.

# Create and update the userinfo/urls.py
# Line 1 – we import path from django urls module.
# Line 3 – we import our views in userinfo app.
# Line 6 – we map our sign-up view to a url.

# Update the tumworkbench/urls.py
# At line 20, we include our urls.py file from userinfo

# Dashboard form in views.py
# Line 24 – we have created a function called user_dashboard which takes one parameter named request.
# Line 28 – we render a template called dashoard.html

# Map url to dashboard function
# Create dashboard.html and map it 
# Line 1 – we extend the base template.
# Line 5 to 12 – we create a top navbar.
# Line 21 to 65 – we create a side navbar for our dashboard.
# Line 69 to 75 – we create a section where the content of the page will be displayed.
# The next step is to create styles.css in the static/css folder and make sure it has the following code:

# Include styles.css file in base.html file.

# Protect our Dashboard from an Unauthenticated User
# Django authentication system offers a convenient way to limit access to pages, in this tutorial we are going to use the login_required decorator.
# Add decorator code to the userinfo/views.py
# Line 5 – we import the login decorator from Django Auth decorators.
# Line 26 – we wrap our dashboard view with the login_decorator.
# How the Login Decorator Works
# If the user isn’t logged in, redirect to settings.LOGIN_URL, passing the current absolute path in the query string. Example: / accounts/login/?next=/dashboard
# If the user is logged in, execute the view normally. The view code is free to assume the user is logged in.

# # Login User in Django (userinfo/views.py)
# Line 1 – we have imported the redirect method.
# Line 17 – we redirect the user to the dashboard URL after sign up.
# Line 33 – we create a function called sign_in.
# Line 34 – we create a variable called msg which is an empty list.
# Line 35 – we check whether the request method is a post.
# Line 36 and 37 –  we get the username and password from the request respectively.
# Line 38 – we create a variable called user and we authenticate a user by passing username and password to the authenticate function.
# Line 39 – we check the user exists in our database or not.
# Line 40 – we check the user account whether it’s active.
# Line 41 – we log in the user at this point.
# Line 42 – we redirect the user to the user dashboard URL.
# Line 44 – if the user account is not active, we send message to the user telling them their account has been deactivated.
# Line 46 – we tell the user their login credentials do not match.
# Line 47 – we display the login form and pass the msg variable.

# Add path to userinfo/urls.py

# Add login.html
# Line 11 to 24 – we check whether the form has errors and display them to the users.
# Line 25 to 36 – we create our login form using bootstrap.

# Set login URL in our settings.py file
# Line 124 - we import the reverse lazy method from Django urls
# Line 125 - we define our login URL and pass the name of our login URL.