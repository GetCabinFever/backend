class AddColumnToAmenities < ActiveRecord::Migration
  def change
    add_column :amenities, :kitchen, :boolean
    add_column :amenities, :internet, :boolean
  end
end
