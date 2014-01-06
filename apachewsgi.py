import os
import sys
import django

def appendPath(path):
   if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'yarr.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()


appendPath('/var/www/localhost/htdocs/priv/yarr')
appendPath('/var/www/localhost/htdocs/priv/yarr/yarr')

