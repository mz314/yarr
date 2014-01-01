from django.shortcuts import render
from django.template import RequestContext, loader
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from userpanel.forms import *

def login(req):
  template=loader.get_template('login.html')
  if req.method=='POST':
   form=LoginForm(req.POST)
  else:
   form=LoginForm()
  context=RequestContext(req, {'form':form})
  return HttpResponse(template.render(context))


def panel(req):
  template=loader.get_template('panel.html')
  context=RequestContext(req, {})
  return HttpResponse(template.render(context))
  