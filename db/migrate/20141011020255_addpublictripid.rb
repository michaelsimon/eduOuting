class Addpublictripid < ActiveRecord::Migration
  def change
  	add_column :trips, :public_id, :string
  end
end
