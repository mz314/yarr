from django.db import models
from torrent_categories.models import *

class Torrent(models.Model):
  title=models.CharField(max_length=255,null=False)
  description=models.TextField()
  torrent_file=models.FileField(upload_to="./torrent_files")
  category=models.ForeignKey(Category)
  approved=models.BooleanField()
  
  def save(self):
    if self.approved is None:
      self.approved=False
    super(Torrent,self).save()
  
  def __unicode__(self):
        return self.title
  
  def get_absolute_url(self):
    return "/torrent/%i" % self.id