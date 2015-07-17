from urllib2 import urlopen
from json import load
apiUrl="http://www.nhtsa.gov/webapi/api/SafetyRatings"
#apiParam= '/modelyear/2010/make/bmw/model/z4/'
apiParam= '/modelyear/2010/make/bmw/model/z4/VehicleId/5590'
outputFormat = '?format=json'
response = urlopen(apiUrl + apiParam + outputFormat)
json_obj = load(response)
for objectCollection in json_obj['Results']:
    for safetyRatingAttribute,safetyRatingValue in objectCollection.iteritems():
        print safetyRatingAttribute, ": ", safetyRatingValue



