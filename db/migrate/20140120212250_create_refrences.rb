class CreateRefrences < ActiveRecord::Migration
  def change
    create_table :refrences do |t|
      t.string :doc, null: false
      t.integer :course_id, null: false

      t.timestamps
    end
  end
end
