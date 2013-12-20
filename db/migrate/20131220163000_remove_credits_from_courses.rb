class RemoveCreditsFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :credits
  end

  def down
    add_column :courses, :credits, :integer
  end
end
