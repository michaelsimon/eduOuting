class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|

    	t.string :section_name
    	t.string :teacher

      t.timestamps
    end
  end
end
