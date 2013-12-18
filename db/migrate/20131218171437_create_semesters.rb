class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
