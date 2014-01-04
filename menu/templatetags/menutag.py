from django import template
from django.shortcuts import render
from django.http import HttpRequest
from django.template import Context, loader
from menu.models import *
from menu.views import *
import re


class MenuNode(template.Node):
    def __init__(self,menu_id):
        self.menu_id=menu_id

    def getActiveId(self,context,items):
        url=context['request'].path
        longest=0
        longest_i=0
        n=0
        for i in items:
            i.active=False
            match=re.match(r''+i.href,url)
            if match is not None:
                str=match.group(0)
                if len(str)>longest:
                    longest=len(str)
                    longest_i=n
            n=n+1
        items[longest_i].active=True


    def render(self,context):
        template=loader.get_template('basic.html')
        items=MenuItem.objects.all()
        self.getActiveId(context,items)
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

