class Enrollment < ActiveRecord::Base

	belongs_to :student, class_name: 'User'
	belongs_to :course

	validates_presence_of :course_id
	validates_presence_of :student_id
  validates_numericality_of :grade, 
                            greater_than_or_equal_to: 0, 
                            less_than_or_equal_to: 4

end
