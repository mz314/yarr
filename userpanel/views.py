from django.shortcuts import render
from django.template import RequestContext, loader
from django.http import HttpResponse
from django.http import HttpResponseRedirect

def login(req):
  template=loader.get_template('login.html')
  context=RequestContext(req, {})
  return HttpResponse(template.render(context))
