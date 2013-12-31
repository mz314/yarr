from django.forms import ModelForm
from torrents.models import *

class addForm(ModelForm):
  class Meta:
    fields = ('title','description','torrent_file','category')
    model=Torrent
  