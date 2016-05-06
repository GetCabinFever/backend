class ChangeCheckInDateInResidences < ActiveRecord::Migration
  def change
  	remove_column :residences, :check_in
  	remove_column :residences, :check_out

  	add_column :residences, :check_in, :time
  	add_column :residences, :check_out, :time
  end
end
