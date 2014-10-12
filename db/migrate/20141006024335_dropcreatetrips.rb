class Dropcreatetrips < ActiveRecord::Migration
  def change

 drop_table :trips
 
 create_table "trips", force: true do |t|
    t.string   "name"
    t.integer  "section_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal  "cost"
    t.string   "location"
    t.string   "foursquare_locid"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  end
end
