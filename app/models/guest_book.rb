class GuestBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :residence 
end
