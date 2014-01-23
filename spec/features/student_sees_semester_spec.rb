require 'spec_helper'

feature 'Student can see what semester a given course is in', %Q{
	As a student
	I want to see which semester each of my courses belongs to
	So that I am aware of when I took what courses
} do

# ACCEPTANCE CRITERIA
# * I must be able to view a course's semester when I am view all courses
# * I must be able to click on a semster to see my GPA
  
  let(:user)                { FactoryGirl.create(:user, role: 'Student') }
  let!(:semester)       { FactoryGirl.create(:semester) }
  let!(:course1)        { FactoryGirl.create(:course, semester_id: semester.id) }
  let!(:course2)        { FactoryGirl.create(:course, semester_id: semester.id) }
  let!(:enrollment1) { FactoryGirl.create(:enrollment, student_id: user.id, course_id: course1.id) }
  let!(:enrollment2) { FactoryGirl.create(:enrollment, student_id: user.id, course_id: course2.id) }

	scenario 'If I click a semester I see my GPA for that course' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_link 'Profile'
    click_link 'My Enrollments'

    expect(page).to have_content(course1.semester.name)
    expect(page).to have_content(course2.semester.name)
	end
end