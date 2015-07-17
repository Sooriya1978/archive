import webapp2

MYPAGE = """\
<html>
 <body>
  <form action="/alvo">
   <label> Nome:
     <input type="text" name="q"> 
   </label>
   <input type="checkbox" name="opt1"> <br>
   <input type="password" name="senha"> <br>
   <input type="radio" name="grupo" value="op1">
   <input type="radio" name="grupo" value="op2">
   <select name="sel">
     <option value="a">A</option>
     <option value="b">B</option>
     <option value="c">C</option>
   <select>
   <input type="submit" >
 </form>
 </body>
</html>
"""

class MainPage(webapp2.RequestHandler):
  def get(self):
    self.response.headers['Content-Type'] = 'text/html'
    self.response.write('This is my form')
    self.response.write(MYPAGE)

class TestHandler(webapp2.RequestHandler):
  #If the form Method is POST use: def post(self)
  def get(self):
    q = self.request.get("q")
    self.response.out.write("This is the value received: ")
    self.response.out.write(q) 
    
    #self.response.out.write("This is the request:")
    #self.response.headers['Content-Type'] = 'text/plain'
    #self.response.out.write(self.request) 

application = webapp2.WSGIApplication([
                                        ('/', MainPage),
                                        ('/alvo', TestHandler),
                                      ], 
                                      debug=True)

