class CreateGuestBooks < ActiveRecord::Migration
  def change
    create_table :guest_books do |t|

      t.timestamps null: false
    end
  end
end
