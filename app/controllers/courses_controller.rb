class CoursesController < ApplicationController

  def show
    if current_user && current_user.role == 'Student'
      redirect_to courses_path, notice: 'You are not authorized to view this page'
    elsif current_user 
      @user = current_user
      @course = Course.find(params[:id])
      @students = []
      @grades = []
      Enrollment.where(course_id: @course.id).each do |enrollment|
        @students << User.find_by(id: enrollment.student_id)
        @grades << enrollment.grade
      end
      if @grades.empty?
        redirect_to courses_path, notice: 'There are no enrollments for that course!'
      else
        @average = @grades.sum/@grades.count
      end
    else
      redirect_to root_path, notice: "You need to sign in to see this page"  
    end
  end

  def index
    if current_user
      @user = current_user
      @all_courses = Course.all
    else
      redirect_to root_path, notice: "You need to sign in to see this page"
    end
  end
end
