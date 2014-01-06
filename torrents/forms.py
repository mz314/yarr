from django.forms import ModelForm
from django.forms import Form
from django import forms
from torrents.models import *
# from var_dump import var_dump

class addForm(ModelForm):
  class Meta:
    fields = ('title','description','torrent_file','category')
    model=Torrent

class searchForm(Form):
    search=forms.CharField(label="Search torrent:")