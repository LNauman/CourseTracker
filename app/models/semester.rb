# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Semester < ActiveRecord::Base

  has_many :courses, foreign_key: 'semester_id'
  
  validates_presence_of :name

end
