class SemestersController < ApplicationController
  def show
    def grade_pt_calc(enroll)
      enroll[:grade] * enroll[:credits]
    end

    if current_user && current_user.role == 'Student'
      @user = current_user
      @semester = Semester.find(params[:id])
      @semester_enrollments = []
      @grade_points = []
      @semester_credits = []
      @user.enrollments.each do |enrollment|  
        if enrollment.course.semester == @semester
          @semester_enrollments << enrollment
        end
      end
        @semester_enrollments.each do |enroll|
          @point = grade_pt_calc(enroll)   
          @grade_points << @point
          @semester_credits << enroll.credits
        end
      @gpa = @grade_points.sum / @semester_credits.sum
    elsif current_user && current_user.role == 'Administrator'
      @semester = Semester.find(params[:id])
      @semester_enrollments = []
      Enrollment.all.each do |enrollment|  
        if enrollment.course.semester == @semester 
          @semester_enrollments << enrollment 
        end
      end
      @enrollments = @semester_enrollments.uniq_by {|c| c.course_id }
    else
      redirect_to root_path, notice: "You're not authorized to view this page"
    end
  end

  def index
    if current_user && current_user.role == 'Administrator'
      @user = current_user
      @semesters = Semester.all.order(:name)
    else
      redirect_to root_path, notice: "You're not authorized to view this page"
    end
  end
end
