from django import forms
from django.forms.widgets import *

class LoginForm(forms.Form):
  username=forms.CharField()
  password=forms.CharField(widget=forms.PasswordInput)

  
  