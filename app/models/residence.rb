class Residence < ActiveRecord::Base
  include PgSearch


  belongs_to :user
  has_one :amenities
  has_one :safety
  has_many :guest_books 

  has_attached_file :image, styles: { 
        medium: "300x300>",
        thumb: "100x100>"
      },
      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude
  before_validation :ensure_coords!

  def ensure_coords!
    unless self.latitude && self.longitude
      self.geocode 
    end
  end

  def full_address
    [address, city, state, zip].compact.join(", ")
  end



end
