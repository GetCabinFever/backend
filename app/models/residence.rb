class Residence < ActiveRecord::Base
  belongs_to :user
  has_one :amenities
  has_one :safety

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
