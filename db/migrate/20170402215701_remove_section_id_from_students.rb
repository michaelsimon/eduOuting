class RemoveSectionIdFromStudents < ActiveRecord::Migration[5.0]
  def change
    remove_column :students, :section_id
  end
end
