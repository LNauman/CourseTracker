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

	 def edit
    # @user = current_user
    # @course = Course.find_by(teacher_id: @user.id)
    # @students = []
    # @all_enroll = Enrollment.where(course_id: @course.id)
	  redirect_to enrollment_path
	  end

	  def update
	    if @user = current_user
	    	@course = Course.find_by(teacher_id: @user.id)     
	      @enrollment = Enrollment.find_by(course_id: @course)
	      	if @enrollment.update_attributes(grade: params[:enrollment][:grade].to_f)
	        	redirect_to @course, notice: "Grade has been updated"
	        	return
	      	else
	        	redirect_to @enrollment, notice: "Grade has not been updated"
	    		end
	    end
	  end

	  def show
			@enrollment = Enrollment.find(params[:id])
	  end

	  protected
  		def enrollment_params
    		params.require(:enrollment).permit(:grade, :course_id, :student_id)
    	end
end
