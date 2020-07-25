from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required

# Create your views here.
def home(request):
  # count = User.objects.count()
  # return render(request, 'user_management/home.html', {
  #   'count': count
  # })
  """
  Render different public or logged in templated based on if the user is logged in or not
  Args:
      request ([request]): [Post]
  """
  if request.user.is_authenticated:
    template= "dashboard/dashboard_home.html"
    context= {}
  else:
    template= "index.html"
    count = User.objects.count()
    context= {'count': count}

  return render (request, template, context)
  
def signup(request):
  if request.method == 'POST':
    form = UserCreationForm(request.POST)
    if form.is_valid():
        form.save()
        return redirect('home')
  else:
    form = UserCreationForm()
  return render(request, 'registration/signup.html', {
    'form': form
  })
  