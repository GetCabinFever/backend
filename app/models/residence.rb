class Residence < ActiveRecord::Base
  # before_save :property_response
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
end
