from django.db import models

class Category(models.Model):
  name=models.CharField(max_length=100,null=False)
  parent_cat=models.ForeignKey('self',null=True,blank=True)
  def __unicode__(self):
    return self.name
  
  #@models.permalink
  def get_absolute_url(self):
   return "/cat/%i" % self.id