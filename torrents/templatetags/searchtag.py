from django import template
from django.shortcuts import render
from django.http import HttpRequest
from django.template import Context, loader
from torrents.forms import *


class SearchNode(template.Node):

  def render(self,context):
   template=loader.get_template('searchbar.html')
   form=searchForm()
   context['form']=form
   #men=Menu.objects.all()
   return template.render(context)


#############################




def searchbar(parser,token):
    return SearchNode()

register = template.Library()
register.tag('searchtag',searchbar)

