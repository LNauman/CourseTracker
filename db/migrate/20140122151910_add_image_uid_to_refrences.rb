class AddImageUidToRefrences < ActiveRecord::Migration
  def up
    add_column :refrences, :image_uid, :string, null: false
  end
  def down
    remove_column :refrences, :image_uid
  end
end
