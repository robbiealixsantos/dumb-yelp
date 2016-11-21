class GooglePlacesApiAdapter
include HTTParty

def self.find_location(location)
    mykey = ENV['GOOGLE_MAPS_KEY']
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{mykey}"
    format :json
    response = HTTParty.get(url)
    body = response.parsed_response
    # location_name = body['results'][0]['formatted_address']
    # latitude = body['results'][0]['geometry']['location']['lat']
    # longitude = body['results'][0]['geometry']['location']['lng']
    # p '*' * 50
end
end