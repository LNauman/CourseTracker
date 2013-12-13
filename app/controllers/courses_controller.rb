class CoursesController < ApplicationController
	
	def new
		@course = Course.new
	end
	
  def index
  	@user = current_user
  	@all_courses = Course.all
  	@user_id = current_user.id
  	@teacher_courses = []
  	@not_teacher_courses = []
  	@all_courses.each do |course|
  		if course.teacher_id == @user_id && @user.role == 'Teacher'
  			@teacher_courses << course
  		else
  			@not_teacher_courses << course
  		end
  	end
  end
end
