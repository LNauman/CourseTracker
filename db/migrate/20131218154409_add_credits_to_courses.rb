class AddCreditsToCourses < ActiveRecord::Migration
  def up
    add_column :courses, :credits, :integer, default: 3
  end
  def down
    remove_column :courses, :credits
  end
end
