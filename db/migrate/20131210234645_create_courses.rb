class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.integer :semester_id,  null: false
      t.integer :teacher_id, null: false

      t.timestamps
    end
  end
end
