from urllib2 import urlopen
website = urlopen("http://placekitten.com/")
print website.read()
