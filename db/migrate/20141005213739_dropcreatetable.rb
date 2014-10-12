class Dropcreatetable < ActiveRecord::Migration
  def change
 drop_table :sections
  create_table "sections", force: true do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  end
end
