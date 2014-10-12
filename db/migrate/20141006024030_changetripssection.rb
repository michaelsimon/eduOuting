class Changetripssection < ActiveRecord::Migration
  def change
  	change_column :trips, :section, :integer
  end
end
