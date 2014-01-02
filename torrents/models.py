from django.db import models
from torrent_categories.models import *
from django.contrib.auth.models import User
from var_dump import var_dump

class Torrent(models.Model):
  title=models.CharField(max_length=255,null=False)
  description=models.TextField()
  torrent_file=models.FileField(upload_to="./torrent_files")
  category=models.ForeignKey(Category)
  approved=models.BooleanField()
  user=models.ForeignKey(User,null=True, blank=True)
  rating=models.PositiveIntegerField(null=True,blank=True)
  
  def save(self):
    print self.user
    if self.approved is None:
      self.approved=False
    #self.user=self.user
    super(Torrent,self).save()



  def __unicode__(self):
        return self.title
  
  def get_absolute_url(self):
    return "/torrent/%i" % self.id