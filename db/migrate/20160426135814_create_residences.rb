class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
      t.string :title_of_page
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :property_type
      t.string :contact_host_email
      t.integer :accommodates
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :beds
      t.integer :base_price
      t.text :description_of_listing
      t.text :house_rules
      t.text :the_space
      t.text :guest_access
      t.text :interaction_with_guests
      t.text :the_area
      t.text :other_things_to_note
      t.date :check_in
      t.date :check_out
      t.attachment :image

      t.timestamps null: false
    end
  end
end
