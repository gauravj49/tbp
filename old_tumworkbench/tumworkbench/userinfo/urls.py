# /tumworkbench/userinfo/urls.py

from django.urls import path, include
from . import views as userinfo_views

urlpatterns = [
    path('',userinfo_views.home, name='home'),
    path('accounts/',userinfo_views.signup, name='signup'),
    path('accounts/', include('django.contrib.auth.urls')),
]