class Drop < ActiveRecord::Migration
  def change
  	drop_table :students
  	drop_table :sections_students
  	create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "emerg_contact_name"
    t.string   "emerg_contact_phone"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  end
end
