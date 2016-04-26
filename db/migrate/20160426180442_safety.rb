class Safety < ActiveRecord::Migration
  def change
  	add_column :safety, :residence_id, :integer
  	add_column :safety, :smoke, :boolean
  	add_column :safety, :co2, :boolean
  	add_column :safety, :first_aid, :boolean
  	add_column :safety, :safety_card, :boolean
  	add_column :safety, :extinguisher, :boolean
  	add_column :safety, :fire_alarm, :boolean
  	add_column :safety, :gas_shutoff, :boolean
  	add_column :safety, :generator, :boolean 
  end
end
