require 'spec_helper'

describe Enrollment do
  
	it { should belong_to :student }
	it { should belong_to :course }

	it { should have_valid(:grade).when(3.33, 4.0) }
  it { should_not have_valid(:grade).when('', nil, 500, 'helloo') }   

  it { should validate_presence_of :student_id }
  it { should validate_presence_of :course_id }

end
