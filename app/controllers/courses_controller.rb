class CoursesController < ApplicationController

  def show
    if current_user && current_user.role == 'Student'
      redirect_to courses_path, notice: 'You are not authorized to view that page'
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
        @average = "There are no enrollments for this course. Why don't you upload some?"
      else
        @average = (@grades.sum/@grades.count).round(2)
      end
    else
      redirect_to root_path, notice: "You need to sign in to see this page"
    end
  end

  def index
    if current_user
      @user = current_user
      @user_courses = @user.courses.page(params[:page]).per(6)
      @all_courses = Course.all.page(params[:page]).per(6)
    else
      redirect_to root_path, notice: "You need to sign in to see this page"
    end
  end
end
