class SemestersController < ApplicationController
  def show
    def grade_pt_calc(enroll)
      enroll[:grade] * enroll[:credits]
    end

    if current_user && current_user.role == 'Student'
      @user = current_user
      @student_enrollments = @user.enrollments
      @semester = Semester.find(params[:id])
      @semester_enrollments = []
      @grade_points = []
      @semester_credits = []
      @student_enrollments.each do |enrollment|  
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
    else
      
      @enrollments = Enrollment.all
      @semester = Semester.find(params[:id])
      @semester_enrollments = []
      @enrollments.each do |enrollment|  
        if enrollment.course.semester == @semester 
          @semester_enrollments << enrollment 
        end
      end
      @enrollments = @semester_enrollments.uniq_by {|c| c.course_id }
    end
  end

  def index
    @semesters = Semester.all.order(:name)
  end
end
