class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|

    	t.string :name
      t.string :section
    	t.datetime :start_date
    	t.datetime :end_date
    	t.decimal :cost
    	t.string :location
    	t.string :foursquare_locid
    	t.text  :details

      t.timestamps
    end
  end
end
