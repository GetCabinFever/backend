class AddTvColumnToAmenities < ActiveRecord::Migration
  def change
  	add_column :amenities, :tv, :boolean
    add_column :amenities, :essentials, :boolean
    add_column :amenities, :shower_essentials, :boolean
    add_column :amenities, :heating, :boolean
    add_column :amenities, :airconditioning, :boolean
    add_column :amenities, :washer, :boolean
    add_column :amenities, :dryer, :boolean
    add_column :amenities, :dishwasher, :boolean
    add_column :amenities, :free_parking, :boolean
    add_column :amenities, :cable, :boolean
    add_column :amenities, :satellite, :boolean
    add_column :amenities, :breakfast, :boolean
    add_column :amenities, :pets, :boolean
    add_column :amenities, :kid_friendly, :boolean
    add_column :amenities, :events, :boolean
    add_column :amenities, :smoking, :boolean
    add_column :amenities, :wheelchair_accessible, :boolean
    add_column :amenities, :elevator, :boolean
    add_column :amenities, :fireplace, :boolean
    add_column :amenities, :intercom, :boolean
    add_column :amenities, :doorman, :boolean
    add_column :amenities, :pool, :boolean
    add_column :amenities, :hottub, :boolean
    add_column :amenities, :gym, :boolean
    add_column :amenities, :hangers, :boolean
    add_column :amenities, :iron, :boolean
    add_column :amenities, :hair_dryer, :boolean
    add_column :amenities, :workstation, :boolean
    add_column :amenities, :billiards, :boolean
  end
end
