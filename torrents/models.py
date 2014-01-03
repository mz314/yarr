from django.db import models
from django.contrib.auth.models import User
from var_dump import var_dump

from django.db import models

class Category(models.Model):
  name=models.CharField(max_length=100,null=False)
  parent_cat=models.ForeignKey('self',null=True,blank=True)
  def __unicode__(self):
    return self.name

  #@models.permalink
  def get_absolute_url(self):
   return "/cat/%i" % self.id

class Torrent(models.Model):
  title=models.CharField(max_length=255,null=False)
  description=models.TextField()
  torrent_file=models.FileField(upload_to="./torrent_files")
  category=models.ForeignKey(Category)
  approved=models.BooleanField()
  user=models.ForeignKey(User,null=True, blank=True)
  rating=models.PositiveIntegerField(null=True,blank=True)
  rate_count=models.PositiveIntegerField(null=True,blank=True)
  
  def search(selfs,query):
      res=Torrent.objects.filter(title__regex=query)
      return res

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