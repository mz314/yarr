from django import template
from django.shortcuts import render
from django.http import HttpRequest
from django.template import Context, loader

from menu.models import *
from menu.views import *


class MenuNode(template.Node):
  def __init__(self,menu_id):
    self.menu_id=menu_id
  
  def render(self,context):
   template=loader.get_template('basic.html')
   items=MenuItem.objects.all()
   req= HttpRequest()
  
   context=Context({'menu_id':self.menu_id,'items':items,'current':context['request'].path}) 
   #men=Menu.objects.all()
   return template.render(context)


#############################

def make_menu(parser, token): 
  tag_name, menu_id = token.split_contents()
  return MenuNode(menu_id)


register = template.Library()
register.tag('menutag',make_menu)