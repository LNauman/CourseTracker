require 'spec_helper'

feature "student can view courses enrolled in", %Q{
	As a student
	I want to be able to see all of the courses I am enrolled in and grades
	So that I can know how I'm doing
} do

# ACCEPTANCE CRITERIA
#* I should see a 'View Courses' button if I am logged in
#* When I click 'View Courses' I will be taken to a page where I see all 
#  courses I am enrolled in
  
	let(:user) { FactoryGirl.create(:user) }
	let(:enrollment1) { FactoryGirl.create(:enrollment, student_id: user.id) }
	let(:enrollment2) {FactoryGirl.create(:enrollment, student_id: (user.id + 1))}
	scenario "Clicks 'View Courses', sees all enrollments" do
    visit root_path
		click_link 'Sign In'

		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		click_link 'View Courses'

    expect(page).to have_content(enrollment1.title)
		expect(page).to have_content('Back')

		expect(page).to_not have_content(enrollment2.title)

	end

	scenario 'If user role is not a teacher they cannot teach courses'

end

