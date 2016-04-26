class CreateSafeties < ActiveRecord::Migration
  def change
    create_table :safeties do |t|
    	t.integer :residence_id
  		t.boolean :smoke, 				default: false
  		t.boolean :co2, 					default: false
  		t.boolean :first_aid, 		default: false
  		t.boolean :safety_card, 	default: false
  		t.boolean :extinguisher, 	default: false
  		t.boolean :fire_alarm, 		default: false
  		t.boolean :gas_shutoff, 	default: false
  		t.boolean :generator, 		default: false
      t.timestamps null: false
    end
  end
end
