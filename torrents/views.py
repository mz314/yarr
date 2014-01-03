from django.http import HttpResponse
from django.http import HttpResponseRedirect
from torrent_categories.models import *
from torrents.models import *
from torrents.forms import *
from django.contrib.auth.decorators import login_required
from django.template import RequestContext, loader



  
@login_required(login_url='/user/login')
def add(req): 
  template=loader.get_template('add.html')
  if req.method=='POST':
   model=Torrent()
   model.user=req.user
   form=addForm(req.POST,req.FILES,instance=model)

   if form.is_valid():
     #if form.Meta.model.user is None:
     #form.Meta.model.user=req.user
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

def search(req):
    results=()
    if req.method=='POST':
        form=searchForm(req.POST)
        results=Torrent.search(Torrent(),req.POST['search'])
    else:
        form=searchForm()
    template=loader.get_template('search.html')
    context=RequestContext(req, {'form':form,'results':results})
    return HttpResponse(template.render(context))