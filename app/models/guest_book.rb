class GuestBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :residence 

  has_attached_file :image, styles: { 
        medium: "300x300>",
        thumb: "100x100>"
      },
      default_url: "/images/:style/missing.png"
end
