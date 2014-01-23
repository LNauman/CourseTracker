# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  semester_id :integer          not null
#  teacher_id  :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Course do

  it { should belong_to :teacher }
  it { should belong_to :semester }

  it { should have_many :enrollments }
  it { should have_many :refrences }

  it { should have_valid(:title).when('Statistics', 'Chemistry') }
  it { should_not have_valid(:title).when('', nil) }   

  it { should validate_presence_of :semester_id }
  it { should validate_presence_of :teacher_id }

end
