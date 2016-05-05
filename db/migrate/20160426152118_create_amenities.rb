class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|
      t.integer :residence_id
      t.boolean :kitchen
      t.boolean :internet
      t.boolean :tv
      t.boolean :essentials
      t.boolean :shower_essentials
      t.boolean :heating
      t.boolean :airconditioning
      t.boolean :washer
      t.boolean :dryer
      t.boolean :dishwasher
      t.boolean :free_parking
      t.boolean :cable
      t.boolean :satellite
      t.boolean :breakfast
      t.boolean :pets
      t.boolean :kid_friendly
      t.boolean :events
      t.boolean :smoking
      t.boolean :wheelchair_accessible
      t.boolean :elevator
      t.boolean :fireplace
      t.boolean :intercom
      t.boolean :doorman
      t.boolean :pool
      t.boolean :hottub
      t.boolean :gym
      t.boolean :hangers
      t.boolean :iron
      t.boolean :hair_dryer
      t.boolean :workstation
      t.boolean :billiards
    end
  end
end
