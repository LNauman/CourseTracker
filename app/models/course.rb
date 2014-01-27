# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  semester_id :integer          not null
#  teacher_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Course < ActiveRecord::Base

  belongs_to :teacher, class_name: 'User'
  belongs_to :semester

  has_many :enrollments, foreign_key: 'course_id'
  has_many :refrences, foreign_key: 'course_id'

  validates_presence_of :title
  validates_presence_of :semester_id
  validates_presence_of :teacher_id

  include GpaCalculations

end
