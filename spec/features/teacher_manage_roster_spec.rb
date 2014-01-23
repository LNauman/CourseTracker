require 'spec_helper'

feature 'teacher can manage roster', %Q{
As a teacher
I want to be able to manage the roster of my courses
So that I can add grades and view students
} do

  # ACCEPTANCE CRITERIA
  # * I should be able to view all the names and grades of
  #   students enolled in the courses I teach
  # * I should be able to add a grade for a student if it is blank
  # * A student should not be able to enter their own grade

  let(:user)                 { FactoryGirl.create(:user, role: 'Teacher') }
  let!(:user1)             { FactoryGirl.create(:user, role: 'Student') }
  let!(:user2)	        { FactoryGirl.create(:user, role: 'Student') }
  let!(:course)           { FactoryGirl.create(:course, teacher_id: user.id, title: 'Tester Title') }
  let!(:enrollment1) { FactoryGirl.create(:enrollment, student_id: user1.id, course_id: course.id) }
  let!(:enrollment2)	 { FactoryGirl.create(:enrollment, student_id: user2.id, course_id: course.id) }

  scenario 'Clicks a course title, sees list of students and grades' do 
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email	
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_link 'Profile'
    click_link 'View Courses'
    click_link 'Tester Title'

    expect(page).to have_content(user1.first_name)
    expect(page).to have_content(user2.last_name)

    expect(page).to_not have_content('My Courses')
  end

  scenario 'Teacher enters correct grade, grade is saved' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email 
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit "/enrollments/#{enrollment1.id}"

    fill_in 'enrollment[grade]', with: 3.2
    click_button 'Submit'

    expect(page).to have_content('Grade has been updated')

    expect(page).to_not have_content('Grade has not been updated')
  end

  scenario 'Teacher enters an invalid grade, grade is not saved' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit "/enrollments/#{enrollment1.id}"

    fill_in 'enrollment[grade]', with: -5.2
    click_button 'Submit'

    expect(page).to have_content('must be a number between 0 and 4')

    expect(page).to_not have_content(-5.2)
    expect(page).to_not have_content('Grade has been updated')
  end
end