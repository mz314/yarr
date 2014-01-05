from django.http import HttpResponse
from django.http import HttpResponseRedirect
from torrent_categories.models import *
from torrents.models import *
from torrents.forms import *
from django.contrib.auth.decorators import login_required
from django.template import RequestContext, loader
from django.views.generic import TemplateView



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
    torrents=()
    if req.method=='POST':
        form=searchForm(req.POST)
        torrents=Torrent.search(Torrent(),req.POST['search'])
    else:
        form=searchForm()
    template=loader.get_template('search.html')
    context=RequestContext(req, {'form':form,'torrents':torrents})
    return HttpResponse(template.render(context))

class ajaxView(TemplateView):
     def post(self, request, *args, **kwargs):
         return HttpResponse('')

     def get(self, request, *args, **kwargs):
         return self.post(request,args,kwargs)

class voteView(ajaxView):
    def post(self, request, *args, **kwargs):
        params=None
        if request.method=='GET':
            params=request.GET
        else:
            params=request.POST
        if 'rating' in params:
            rating=params['rating']
            rmodel=Rates()
            rmodel.rate(1,request.user,5)
        else:
            return HttpResponse('Error')
        return HttpResponse(rating)
