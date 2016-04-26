class SetDefaults < ActiveRecord::Migration
  def change
  	change_table :amenities do |t|
  		t.change :kitchen, :boolean, default: false
  end
end
