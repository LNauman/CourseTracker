class Course < ActiveRecord::Base
  dragonfly_accessor :image

  belongs_to :teacher, class_name: 'User'
  belongs_to :semester

  has_many :enrollments, foreign_key: 'course_id'
  has_many :refrences, foreign_key: 'course_id'

  validates_presence_of :title
  validates_presence_of :semester_id
  validates_presence_of :teacher_id

end
