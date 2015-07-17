import webapp2

MYPAGE = """\
<html>
 <body>
  What is your birthday? <br>
  <form method="post">
   <input type="text" name="month"> 
   <input type="text" name="day"> 
   <input type="text" name="year">
   <br> 
   <input type="submit" >
 </form>
 </body>
</html>
"""

class MainPage(webapp2.RequestHandler):
  def get(self):
    self.response.headers['Content-Type'] = 'text/html'
    self.response.out.write(MYPAGE)
  def post(self):
    self.response.out.write("I got the data!")


application = webapp2.WSGIApplication([
                                        ('/', MainPage),
                                      ], 
                                      debug=True)

