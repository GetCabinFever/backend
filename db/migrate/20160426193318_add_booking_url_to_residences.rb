class AddBookingUrlToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :booking_url, :text
  end
end
