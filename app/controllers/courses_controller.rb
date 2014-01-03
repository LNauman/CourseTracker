class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def show
    if current_user && current_user.role == 'Student'
      redirect_to courses_path, notice: 'You are not authorized to view this page'
    elsif
      @user = current_user
      @course = Course.find(params[:id])
      @students = []
      @all_enroll = Enrollment.where(course_id: @course.id)
      @grades = []
      @all_enroll.each do |enrollment|
        @students << User.find_by(id: enrollment.student_id)
          grade = enrollment.grade
        @grades << grade
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
      # @user_id = @user.id
      @courses = current_user.courses
      # @not_teacher_courses = []
      # @all_courses.each do |course|
      #   if course.teacher_id == @user.id && @user.role == 'Teacher'
      #     @teacher_courses << course
    else
      redirect_to root_path, notice: "You need to sign in to see this page"
    end
  end
end
