require 'mechanize'

class Residence < ActiveRecord::Base
  include PgSearch

  belongs_to :user
  has_many :amenities
  has_many :safeties
  has_many :guest_books

  has_attached_file :image, styles: {
        medium: "300x300>",
        thumb: "100x100>"
      },
      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def zillow_scrape(query)
    mechanize = Mechanize.new
    page = mechanize.get("http://www.zillow.com/homes/#{query}")
  end

  def zillow_ids(page)
    results = Array.new
    page.css('article').map do |node|
      results << node.attributes.values[2].value.gsub(/\D/,'')
    end
    results
  end

  def self.import(results)
    results.map do |id|
      attributes = Rubillow::PropertyDetails.updated_property_details({zpid: results.id})
      Residence.new(address:   attributes['street'],
                    zip:       attributes['zipcode'],
                    state:     attributes['state'],
                    latitude:  attributes['latitude'],
                    longitude: attributes['longitude'],
                    description_of_listing: attributes['homeDescription'])
    end
  end
end
