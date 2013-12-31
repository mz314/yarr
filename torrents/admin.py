from django.contrib import admin
from torrents.models import *

class TorrentAdmin(admin.ModelAdmin):
    list_display=('title','category')
    list_filter=('category',)
    search_fields=('title',)
   

admin.site.register(Torrent,TorrentAdmin)