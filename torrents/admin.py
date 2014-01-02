from django.contrib import admin
from torrents.models import *

class TorrentAdmin(admin.ModelAdmin):
    list_display=('title','category','user','approved')
    list_filter=('category',)
    search_fields=('title',)
    fields = ('title', 'description','torrent_file','category','approved')
    def save_model(self, request, task, form, change):
      #print request
      task.user=request.user
      task.save()



admin.site.register(Torrent,TorrentAdmin)