from django.conf.urls import patterns, include, url

from django.contrib import admin

from torrent_categories import views

admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'yarr.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    #url(r'^cat/.*', include('torrent_categories.urls')),
    url(r'^$', 'torrent_categories.views.landing'),
    url(r'^cat/(.*)$', 'torrent_categories.views.category',name='category'),
    url(r'^torrent/search$','torrents.views.search'),
    url(r'^torrent/torrent_files/(.*)$','django.views.static.serve', {'document_root': 'torrent_files'}),
    url(r'^torrent/add$','torrents.views.add'),
    url(r'^torrent/(.*)$','torrents.views.details'),

    url(r'^user/$','userpanel.views.panel'),
    url(r'^user/login$','userpanel.views.login_user'),
    url(r'^user/logout$','userpanel.views.logout_user'),
    url(r'^admin/', include(admin.site.urls)),
    
)
