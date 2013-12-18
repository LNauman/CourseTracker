class User < ActiveRecord::Base
  
  has_many :courses, foreign_key: 'teacher_id'
  has_many :enrollments, foreign_key: 'student_id'
  has_many :semesters, through: :courses

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :role

  ROLES = ['Student', 'Teacher', 'Administrator']

  validates_inclusion_of :role, in: ROLES

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
