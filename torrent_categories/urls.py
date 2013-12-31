from django.conf.urls import patterns, include, url

from torrent_categories import views

urlpatterns = patterns('',
  # url(r'', views.default, name='default'),
  url(r'.*',views.category,name='category')
 )