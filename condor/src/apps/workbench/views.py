from django.shortcuts import render, redirect
from django.contrib.auth.models import User

# Create your views here.
def workbench_home(request):
  """View after successful login

  Args:
      request ([type]): [description]

  Returns:
      [type]: [description]
  """
  template= "workbench/base_workbench.html"
  context= {}
  return render (request, template, context)