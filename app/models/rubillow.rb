require 'pry'

module
class Rubillow
  include HTTParty
  base_uri 'http://www.zillow.com/webservice/GetDeepSearchResults.htm'

  def initialize(zws_id)
    @header = {
      'Authorization' => ENV['ZWSID'],
      'User-Agent'    => 'HTTParty'
    }
  end
