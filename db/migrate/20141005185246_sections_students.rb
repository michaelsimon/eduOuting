class SectionsStudents < ActiveRecord::Migration
  def change
  	create_table :sections_students, id: false do |t|
      t.belongs_to :section
      t.belongs_to :student
  	end
  end
end
