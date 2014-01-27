module GpaCalculations
  extend ActiveSupport::Concern

  # models are expected to have a enrollments function

  def gpa_for(semester_id)
    semester_enrollments = self.enrollments.joins(:course).where("courses.semester_id = ?", semester_id)
    compute_gpa(semester_enrollments)
  end

  def gpa
    compute_gpa(self.enrollments)
  end

  private

  def compute_gpa(enrollments)
    enrollments.select(" SUM(grade * credits) / SUM(credits)  AS sum_id").reorder("").first.sum_id
  end

end