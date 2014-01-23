# == Schema Information
#
# Table name: refrences
#
#  id         :integer          not null, primary key
#  course_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)      not null
#  image_uid  :string(255)      not null
#

require 'spec_helper'

describe Refrence do
  
  it { should belong_to  :course }

  it { should validate_presence_of :course_id  }
  
  it { should have_valid(:name).when('Syllabus', 'Test Prep') }
  it { should_not have_valid(:name).when('', nil) }

end