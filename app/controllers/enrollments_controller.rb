class EnrollmentsController < ApplicationController

	def index
		if current_user
			@user = current_user
			@student_enrollments = Enrollment.where(student_id: @user.id)
			@course_titles = []
			@grades = []

			@student_enrollments.each do |enrollment|
				@title = Course.find(enrollment.course_id).title
				@grade = enrollment.grade
				@course_titles << @title
				@grades << @grade
			end
		else
			flash[:notice] = "You aren't enrolled in any classes, you don't even go here!"
		end
	end

end
