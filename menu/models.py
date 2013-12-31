from django.db import models

class Menu(models.Model):
  title=models.CharField(max_length=100)
  def __unicode__(self):
    return self.title
  
  
class MenuItem(models.Model):
  title=models.CharField(max_length=45)
  href=models.CharField(max_length=255)
  menu=models.ForeignKey(Menu,null=True,blank=True)
  parent=models.ForeignKey('self',null=True,blank=True)
  
  def __unicode__(self):
    return self.title