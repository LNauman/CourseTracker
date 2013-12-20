class AddCreditsToEnrollments < ActiveRecord::Migration
  def up
    add_column :enrollments, :credits, :integer, null: false, default: 3
  end

  def down
    remove_column :enrollments, :credits
  end
end
