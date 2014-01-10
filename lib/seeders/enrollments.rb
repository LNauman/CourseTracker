require 'csv'

module Seeders
  module Enrollments
    class << self

      def enrollments
        enrollments = []
        CSV.foreach("#{Rails.root}/db/data/enrollments.csv",
          headers: true,
          header_converters: :symbol) do |row|
          enrollments << row.to_hash
        end
        enrollments
      end
      
      def seed
        Seeders::Enrollments.enrollments.each do |enrollment|
          entry = Enrollment.find_by(course_id: enrollment[:course_id], student_id: enrollment[:student_id])
          if entry.nil?
            entry = Enrollment.new(enrollment)
          else
            entry.update_attributes(enrollment)
          end
          entry.save!
        end
      end
    end
  end
end
