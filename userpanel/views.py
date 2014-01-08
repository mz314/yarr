from django.shortcuts import render
from django.template import RequestContext, loader
from django.http import HttpResponse, HttpResponseRedirect
from userpanel.forms import *
from django.contrib.auth import authenticate, login, logout
# from var_dump import var_dump
from django.contrib.auth.decorators import login_required

def logout_user(req):
  logout(req)
  return HttpResponseRedirect('/')

def login_user(req):
  template=loader.get_template('login.html')
  message=''
  if req.method=='POST':
   username = req.POST['username']
   password = req.POST['password']
   user = authenticate(username=username, password=password)
   print user
   if user is not None:
    login(req,user)
    return HttpResponseRedirect('/user')
   else:  
    message='Login failure'
    login_form=LoginForm(req.POST)
  else:
   message='Please login'
   login_form=LoginForm()
  context=RequestContext(req, {'login_form':login_form,'message':message})
  return HttpResponse(template.render(context))

@login_required(login_url='/user/login')
def panel(req):
  
  template=loader.get_template('panel.html')
  context=RequestContext(req, {'user':req.user})
  return HttpResponse(template.render(context))
  