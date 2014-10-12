class Teachers < ActiveRecord::Migration
  def change
  	create_table :teachers do |t|
  		t.string :first_name
  		t.string :last_name
    	t.belongs_to :user
  end
  remove_column :users, :first_name
  remove_column :users, :last_name
  end
end