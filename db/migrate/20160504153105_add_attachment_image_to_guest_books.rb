class AddAttachmentImageToGuestBooks < ActiveRecord::Migration
  def self.up
    change_table :guest_books do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :guest_books, :image
  end
end
