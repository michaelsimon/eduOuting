class CreateStudentSections < ActiveRecord::Migration[5.0]
  def change
    create_table :student_sections do |t|
      t.references :student
      t.references :section
      t.timestamps
    end
  end
end
