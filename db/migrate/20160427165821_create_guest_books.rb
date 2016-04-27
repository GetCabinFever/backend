class CreateGuestBooks < ActiveRecord::Migration
  def change
    create_table :guest_books do |t|
      t.integer :user_id
      t.integer :residence_id
      t.text :entry

      t.timestamps null: false
    end
  end
end
