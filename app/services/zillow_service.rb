class ZillowScraper

end


#   def zillow_scrape(query)
#     page = get_page(query)
#     zillow_ids(page)
#   end
#
#   def get_page(query)
#     mechanize = Mechanize.new
#     page = mechanize.get("http://www.zillow.com/homes/#{query}")
#   end
#
#   def zillow_ids(page)
#     page.search('article').map do |node|
#       node.attributes.values[2].value.gsub(/\D/,'')
#     end
#   end
#
# end


=begin

Inside your controller, you may simply create a zillow scraper object

@zillow = ZillowScraper.new
results = []
zillow_ids = @zillow.zillow_scrape(params[:query])
zillow_ids.each do |zillow_id|
  results << Residence.import_from_zillow(zillow_id)
end
results.map {|x| x.save }


=end
