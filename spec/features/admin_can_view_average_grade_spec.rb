require 'spec_helper'

feature 'Administrator can see what semester a given course is in', %Q{
  As an administrator
  I want to see the average grade for a given course in a given semester
  So that I can see how students are doing
} do

  # ACCEPTANCE CRITERIA
  # * I must be able to see a list of all courses 
  # * When I click on a specfic course I should be able to see the average grade for that course, 
  #   for that specific semester

  let(:user)         { FactoryGirl.create(:user, role: 'Administrator') }
  let!(:semester)    { FactoryGirl.create(:semester) }
  let!(:course1)     { FactoryGirl.create(:course, semester_id: semester.id) }
  let!(:course2)     { FactoryGirl.create(:course, semester_id: semester.id) }
  let!(:enrollment1) { FactoryGirl.create(:enrollment, student_id: 4, course_id: course1.id) }
  let!(:enrollment2) { FactoryGirl.create(:enrollment, student_id: 3, course_id: course1.id, grade: 2.11) }
  let!(:enrollment3) { FactoryGirl.create(:enrollment, student_id: 4, course_id: course2.id) }

  scenario 'If I click a course title I can see the average grade for that course' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_link 'Profile'
    click_link 'View Courses'
    click_link course1.title

    expect(page).to have_content("Average grade for #{course1.title}(#{course1.semester.name}) is: ")
    expect(page).to have_content(2.72)
  
    expect(page).to_not have_content('View Courses')

  end
end
