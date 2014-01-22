class RemoveDocFromRefrences < ActiveRecord::Migration
  def up
    remove_column :refrences, :doc
  end
  def down
    add_column :refrences, :doc, :string, null: false  
  end
end
