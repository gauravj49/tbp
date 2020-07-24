# /apps/user_management/urls.py

from django.urls import path, include
from . import views as user_management_views

urlpatterns = [
    path('',user_management_views.home, name='home'),
    path('accounts/',user_management_views.signup, name='signup'),
    path('accounts/', include('django.contrib.auth.urls')),
]