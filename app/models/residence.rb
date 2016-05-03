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

  

end
