# -*- coding: utf-8 -*-
from django.shortcuts import render
from apps.sum.forms import SumForm

# For python scripts
import subprocess
import sys

# Create your views here.
def sum(request):
  """ Call the python script to add two integers

  Args:
      request (HttpRequest): request

  Returns:
      [HttpResponse]: Request
  """
  form    = SumForm(request.POST or None)
  if form.is_valid():
    print(form.cleaned_data)
    variable1 = request.POST['variable1']
    variable2 = request.POST['variable2']
    output    = python_sum(variable1, variable2)
    print(output)
    context = {"variable1": variable1, 
    "variable2": variable2,
    "output": output}
    return render(request, "sum/sum.html", context)
  context = {"form": form, }
  return render(request, "sum/sum.html", context)

def python_sum(var1, var2):
  """[summary]

  Args:
      var1 ([int]): Integer number 1
      var2 ([int]): Integer number 2

  Returns:
      [int]: Sum of two integers
  """
  #	process = subprocess.Popen("grep -v \"^@\" {0} | cut -f3 | sort | uniq -c | column -t ".format(input_file), shell=True, stdout=subprocess.PIPE)
  #    stdout_list = process.communicate()[0].split('\n')
  #    stdout_list = filter(None, stdout_list) # filter out empty lines
  process = subprocess.Popen("static/scripts/sum.py -v1={0} -v2={1}".format(var1, var2), shell=True, stdout=subprocess.PIPE)
  output = process.communicate()[0]
  return str(output, 'utf-8')
