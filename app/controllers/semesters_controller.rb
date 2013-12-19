class SemestersController < ApplicationController
  def show
    @semester = Semester.find(params[:id])
  end
end

#   def show
#     if current_user.role == 'Student'
#       @semester_enrollments = []
#       @student_enrollments = Enrollment.where(student_id: current_user.id)
#       @semester = Semester.find(params[:id])
#       @student_enrollments.each do |enrollment|
#         if enrollment.course.semester == @semester
#           @semester_enrollments << enrollment
          
#           @semester_enrollments
#         end
#       end
#     end
#   end    
# end



      # now I have all of the enrollments of a particular student in a particular semester
      # I need to calculate the grade points for each enrollment and divide that by total credit hours
      # that will equal the GPA