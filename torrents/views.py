from django.http import HttpResponse
from django.http import HttpResponseRedirect
from torrent_categories.models import *
from torrents.models import *
from torrents.forms import *
from django.template import RequestContext, loader



  

def add(req): 
  template=loader.get_template('add.html')
  if req.method=='POST':
   form=addForm(req.POST,req.FILES)
   if form.is_valid():
     form.save()
     template=loader.get_template('add_ok.html')
     context=RequestContext(req, {})
     #TODO: handle refresh
     return HttpResponse(template.render(context))
  else:
   form=addForm()
  
  context=RequestContext(req, {'form':form})
  return HttpResponse(template.render(context))

def details(req,torrent_id):
  template=loader.get_template('details.html')
  tor=Torrent.objects.get(id=torrent_id)
  context=RequestContext(req, {'torrent':tor})
  return HttpResponse(template.render(context))