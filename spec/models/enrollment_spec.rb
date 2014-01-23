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

require 'spec_helper'

describe Enrollment do

  it { should belong_to :student }
  it { should belong_to :course }

  it { should validate_presence_of :course_id }
  it { should validate_presence_of :student_id }

  it { should have_valid(:grade).when(3.33, 4.0) }
  it { should_not have_valid(:grade).when('', nil, 500, 'helloo', -3) }   

end
