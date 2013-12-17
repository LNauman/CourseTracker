require 'spec_helper'

describe User do
  it { should have_many :courses }
  it { should have_many(:semesters).through(:courses) }

  it { should have_valid(:email).when('john@example.com', 'sally.doe@example.com') }
  it { should_not have_valid(:email).when('', nil, 'hellooo') }   

  it { should have_valid(:first_name).when('John', 'Sally') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith', 'Doe') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:role).when('Student', 'Teacher') }
  it { should_not have_valid(:role).when(nil, '') }

  it 'has matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end 
end
