class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def show
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
    @average = @grades.sum/@grades.count
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
