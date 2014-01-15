require 'csv'

class EnrollmentsController < ApplicationController

  def show
    if current_user
      @enrollment = Enrollment.find(params[:id])
    else
      redirect_to root_path, notice: "You aren't enrolled in any classes, you don't even go here!"
    end
  end

  def index
    if current_user
      @user = current_user
      @student_enrollments = @user.enrollments
    else 
      redirect_to root_path, notice: "You aren't enrolled in any classes, you don't even go here!"
    end
  end

  def edit
    redirect_to enrollment_path
  end

  def update
    @enrollment = Enrollment.find(params[:id])
    @course_id = @enrollment.course_id
    if @enrollment.course.teacher == current_user
      if @enrollment.update_attributes(grade: params[:enrollment][:grade])
        redirect_to "/courses/#{@course_id}", notice: 'Grade has been updated'
      else
      redirect_to @enrollment, notice: 'Failed to update, must be a number between 0 and 4'
      end
    else
      redirect_to @enrollment, notice: 'Not authorized to edit this field'
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @course_id = @enrollment.course_id
    @enrollment.destroy
    redirect_to "/courses/#{@course_id}", notice: 'Enrollment has been removed successfully'
  end

  def import 
    if params[:file].blank?
      redirect_to courses_path, notice: "Please select a file to upload!"
    else
      Enrollment.import(params[:file])
      redirect_to courses_path, notice: "Enrollments imported."
    end
  end

  protected

  def enrollment_params
    params.require(:enrollment).permit(:grade, :course_id, :student_id)
  end
end
