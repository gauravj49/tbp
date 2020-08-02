# /apps/sum/urls.py

from django.urls import path, include
from . import views as sum_views

urlpatterns = [
    path('',sum_views.sum, name='sum'),

]