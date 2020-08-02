from django import forms

# Get a simple form and not a model form
class SumForm(forms.Form):
	variable1 = forms.IntegerField(initial=0)
	variable2 = forms.IntegerField(initial=0)
#	email     = forms.EmailField()
	