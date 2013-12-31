from django.contrib import admin
from torrent_categories.models import *

class CategoryAdmin(admin.ModelAdmin):
  list_display=('name','parent_cat')

admin.site.register(Category,CategoryAdmin)
