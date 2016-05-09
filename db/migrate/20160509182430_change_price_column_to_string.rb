class ChangePriceColumnToString < ActiveRecord::Migration
  
  def change
    change_column :residences, :base_price, :string
  end
  
end
