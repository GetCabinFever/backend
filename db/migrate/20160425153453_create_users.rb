class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :auth_token
      t.string :email
      t.boolean :owner
      t.boolean :renter
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :dob
      t.attachment :avatar 

      t.timestamps null: false
    end
  end
end
