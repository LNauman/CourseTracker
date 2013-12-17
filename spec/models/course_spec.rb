require 'spec_helper'

describe Course do

  it { should belong_to :semester }
  it { should belong_to :teacher }

  it { should have_valid(:title).when('Statistics', 'Chemistry') }
  it { should_not have_valid(:title).when('', nil) }   

  it { should validate_presence_of :semester_id }
  it { should validate_presence_of :teacher_id }

end
