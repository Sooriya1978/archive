# Instructions to run
# 1) Download the engine: https://developers.google.com/appengine/downloads
# 2) google_appengine/dev_appserver.py --port 45222 mygits/hello/
# 3) look local: localhost:45222
# 4) create a project and get ID: https://console.developers.google.com
# 5) Send to googleapp: google_appengine/appcfg.py update mygits/hello
# 6) Check online: http://thigoveudacity.appspot.com/

#Runnig outsite engine:
#sudo apt-get install python-setuptools
#easy_install webapp2
#easy_install WebOb
#easy_install Paste

import webapp2

class MainPage(webapp2.RequestHandler):
    def get(self):
        self.response.headers['Content-Type'] = 'text/plain'
        self.response.write('Hello, World! I am the guy!!!')

application = webapp2.WSGIApplication([
    ('/', MainPage),
], debug=True)

