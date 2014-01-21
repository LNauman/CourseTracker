class AddNameToRefrences < ActiveRecord::Migration
  def up
    add_column :refrences, :name, :string, null: false
  end
  def down
    remove_column :refrences, :name
  end
end
