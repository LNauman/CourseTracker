require 'csv'

module Seeders
  module Courses
    class << self

      def courses
        courses = []
        CSV.foreach("#{Rails.root}/db/data/courses.csv",
          headers: true,
          header_converters: :symbol) do |row|
          courses << row.to_hash
        end
        courses
      end
      def seed
        Seeders::Courses.courses.each do |course|
          entry = Course.find_by(title: course[:title])
          if entry.nil?
            entry = Course.new(course)
          else
            entry.update_attributes(course)
          end
          entry.save!
        end
      end
    end
  end
end
