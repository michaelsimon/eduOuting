class Changeteachercolumntype < ActiveRecord::Migration
  def change
  	change_column :sections, :teacher, :integer
  end
end
