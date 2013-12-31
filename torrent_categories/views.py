from django.http import HttpResponse
from torrent_categories.models import *
from torrents.models import *
from django.template import RequestContext, loader



def landing(req):
  template=loader.get_template('landing.html')
  context=RequestContext(req, {'test':'123'})
  return HttpResponse(template.render(context))

  

def category(req,catid): 
  template=loader.get_template('category.html')
  if catid<>'':
   cats=Category.objects.filter(parent_cat=catid)
   torrents=Torrent.objects.filter(category_id=catid,approved=True)
  else:
   cats=Category.objects.filter(parent_cat=None)
   torrents=()
  context=RequestContext(req, {'catid':catid,'cats':cats,'torrents':torrents,'breads':'http://stackoverflow.com/questions/826889/how-to-implement-breadcrumbs-in-a-django-template'})
  return HttpResponse(template.render(context))
  