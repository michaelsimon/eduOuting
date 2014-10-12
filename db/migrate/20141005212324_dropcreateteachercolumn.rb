class Dropcreateteachercolumn < ActiveRecord::Migration
  def change
  	  remove_column :sections, :teacher
  	  add_column :sections, :teacher, :integer
  end
end
