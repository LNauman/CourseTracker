# == Schema Information
#
# Table name: semesters
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Semester do

  it { should have_many :courses }

  it { should have_valid(:name).when('Fall 2013', 'Spring 2009') }
  it { should_not have_valid(:name).when('', nil) }   

end
