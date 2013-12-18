class EnrollmentsController < ApplicationController

  def index
    if current_user
    @user = current_user
    @student_enrollments = @user.enrollments
    else
      flash[:notice] = "You aren't enrolled in any classes, you don't even go here!"
    end
  end

  def edit
    redirect_to enrollment_path
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    if @enrollment.course.teacher == current_user
      if @enrollment.update_attributes(grade: params[:enrollment][:grade])
        redirect_to @enrollment, notice: 'Grade has been updated'
      else
      redirect_to @enrollment, notice: 'Failed to update, must be a number between 0 and 4'
      end
    else
      redirect_to @enrollment, notice: 'Not authorized to edit this field'
    end
  end

#   if @user = current_user 
# 	@course = Course.find_by(teacher_id: @user.id)     
#   @enrollment = Enrollment.find_by(course_id: @course)
#       if @enrollment.update_attributes(grade: params[:enrollment][:grade].to_f)
#       	redirect_to @course, notice: "Grade has been updated"
#       	return
#     	else
#       	redirect_to @enrollment, notice: "Must be a number between 0 and 4"
#   		end
#   end
# end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  protected

  def enrollment_params
    params.require(:enrollment).permit(:grade, :course_id, :student_id)
  end
end
