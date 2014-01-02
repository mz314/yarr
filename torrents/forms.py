from django.forms import ModelForm
from torrents.models import *
from var_dump import var_dump

class addForm(ModelForm):
  class Meta:
    fields = ('title','description','torrent_file','category')
    model=Torrent
