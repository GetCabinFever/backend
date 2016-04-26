class SetDefaults < ActiveRecord::Migration
  def change
  	change_table :amenities do |t|
  		t.change :kitchen, :boolean, default: false
  		t.change :internet, :boolean, default: false
  		t.change :tv, :boolean, default: false
    	t.change :essentials, :boolean, default: false
    	t.change :shower_essentials, :boolean, default: false
	    t.change :heating, :boolean, default: false
	    t.change :airconditioning, :boolean, default: false
	    t.change :washer, :boolean, default: false
	    t.change :dryer, :boolean, default: false
	    t.change :dishwasher, :boolean, default: false
	    t.change :free_parking, :boolean, default: false
	    t.change :cable, :boolean, default: false
	    t.change :satellite, :boolean, default: false
	    t.change :breakfast, :boolean, default: false
	    t.change :pets, :boolean, default: false
	    t.change :kid_friendly, :boolean, default: false
	    t.change :events, :boolean, default: false
	    t.change :smoking, :boolean, default: false
	    t.change :wheelchair_accessible, :boolean, default: false
	    t.change :elevator, :boolean, default: false
	    t.change :fireplace, :boolean, default: false
	    t.change :intercom, :boolean, default: false
	    t.change :doorman, :boolean, default: false
	    t.change :pool, :boolean, default: false
	    t.change :hottub, :boolean, default: false
	    t.change :gym, :boolean, default: false
	    t.change :hangers, :boolean, default: false
	    t.change :iron, :boolean, default: false
	    t.change :hair_dryer, :boolean, default: false
	    t.change :workstation, :boolean, default: false
	    t.change :billiards, :boolean, default: false
  	end
  end
end
