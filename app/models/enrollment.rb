# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  student_id :integer          not null
#  course_id  :integer          not null
#  grade      :float
#  created_at :datetime
#  updated_at :datetime
#  credits    :integer          default(3), not null
#

class Enrollment < ActiveRecord::Base

  belongs_to :student, class_name: 'User'
  belongs_to :course

  validates_presence_of :course_id
  validates_presence_of :student_id
  validates_numericality_of :credits
  validates_numericality_of :grade,
                            greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 4
  def self.import(file, course_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      enrollment = find_by_id(row['id']) || new
      row = row.to_hash
      row[:course_id] = course_id
      enrollment.attributes = row
      enrollment.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv'  then Roo::Csv.new(file.path, nil, :ignore)
    when '.xls'  then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
