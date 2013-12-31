from django.contrib import admin
from menu.models import *

class MenuAdmin(admin.ModelAdmin):
  pass
  

class ItemAdmin(admin.ModelAdmin):
  list_display=('title','parent','menu')
  list_filter=('menu',)

admin.site.register(Menu,MenuAdmin)
admin.site.register(MenuItem,ItemAdmin)