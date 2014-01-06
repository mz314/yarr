import os
import sys
import django

def appendPath(path):
   if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'yarr.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()

<<<<<<< HEAD
path = '/var/www/localhost/htdocs/priv/yarr'
if path not in sys.path:
    sys.path.append(path) 
=======
appendPath('/var/www/localhost/htdocs/priv/yarr')
appendPath('/var/www/localhost/htdocs/priv/yarr/yarr')
>>>>>>> d6edb5ab7501733a49155c93abc1ac2a1bd91996
