class AddResidenceIdToAmenities < ActiveRecord::Migration
  def change
    add_column :amenities, :residence_id, :integer
  end
end
