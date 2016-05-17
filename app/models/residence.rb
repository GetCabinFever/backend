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

  # def import_from_zillow(zws_id, zpid, count)
    # properties = Rubillow::PropertyDetails.deep_comps
    #   {
    #     zws_id: params['zws-id'],
    #     zpid:   params['zpid'],
    #     count:  params['count']
    #   }
  #   Residence.new(address:   properties['street'],
  #                 city:      properties['city'],
  #                 state:     properties['state'],
  #                 zip:       properties['zipcode'],
  #                 latitude:  properties['latitude'],
  #                 longitude: properties['longitude'])
  # end

  # def self.import_from_zillow(zillow_id)
  #   attributes = Rubillow::PropertyDetails.updated_property_details({zpid: zillow_id})
  #   Residence.new(address:   attributes['street'],
  #                 zip:       attributes['zipcode'],
  #                 state:     attributes['state'],
  #                 latitude:  attributes['latitude'],
  #                 longitude: attributes['longitude'],
  #                 description_of_listing: attributes['homeDescription'])
  # end
end
