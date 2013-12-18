require 'spec_helper'

describe Semester do

  it { should have_many :courses }

  it { should have_valid(:name).when('Fall 2013', 'Spring 2009') }
  it { should_not have_valid(:name).when('', nil) }   

end
