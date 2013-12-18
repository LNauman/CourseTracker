class Semester < ActiveRecord::Base

  has_many :courses, foreign_key: 'semester_id'
  
  validates_presence_of :name

end
