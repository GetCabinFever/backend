class AddColumnToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :user_id, :integer
  end
end
