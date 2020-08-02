# /apps/workbench/urls.py

from django.urls import path, include
from apps.user_management import views as user_management_views
from . import views as workbench_views
from django.views.generic import TemplateView

app_name = "workbench"
urlpatterns = [
    path('',user_management_views.home, name='home'),
    path('workbench/',workbench_views.workbench_home, name='workbench_home'),
    # path('', TemplateView.as_view(template_name='workbench/base_workbench.html')),
]
