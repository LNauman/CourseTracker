require 'spec_helper'

feature "I can view all courses", %Q{
	As a teacher
	I want to be able to see all of the courses
	So that I can manage them
} do

# ACCEPTANCE CRITERIA
#* I should see a 'View My Courses' button if I am logged in
#* When I click 'view courses' I should be able to see all of the courses
  
	let(:user) { FactoryGirl.create(:user) }
	let!(:course1) { FactoryGirl.create(:course, teacher_id: user.id) }
	# let!(:course2) { FactoryGirl.create(:course, teacher_id: (user.id + 1)) }
	scenario "When I click 'View My Courses' I see a list of what I teach" do
    visit root_path
		click_link 'Sign In'

		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		click_link 'View Courses'

    expect(page).to have_content(course1.title)
		expect(page).to have_content('Back')


# need to make it so view only displays my courses if @user.role == teacher

	end

	scenario 'If user role is not a teacher they cannot teach courses'

end

