class AddColumnToAmenities < ActiveRecord::Migration
  def change
    add_column :amenities, :kitchen, :boolean
    add_column :amenities, :internet, :boolean
    add_column :amenities, :tv, :boolean
    

  end
end
