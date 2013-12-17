require 'spec_helper'

feature "student can view courses enrolled in", %Q{
	As a student
	I want to be able to see all of the courses I am enrolled in and grades
	So that I can know how I'm doing
} do

	# ACCEPTANCE CRITERIA
	#* I should see a 'My Enrollments' button if I am logged in
	#* When I click 'My Enrollments' I will be taken to a page where I see all 
	#  courses I am enrolled in
  
	let(:user)         { FactoryGirl.create(:user, role: 'Student') }
	let(:course)       { FactoryGirl.create(:course) }
	let!(:enrollment1) { FactoryGirl.create(:enrollment, course_id: course.id, student_id: user.id) }

	scenario "Clicks 'My Enrollments', sees all enrollments" do
    visit root_path
		click_link 'Sign In'

		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		click_link 'Profile'
		click_link 'My Enrollments'

		expect(page).to have_content('Course Title')
		expect(page).to have_content(course.title)


		expect(page).to_not have_content('View Courses')
	end

	scenario 'If user role is not a teacher they cannot teach courses'
end

