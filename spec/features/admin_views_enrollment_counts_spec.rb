require 'spec_helper'

feature 'Administrator can view enrollment counts for all courses in a given semester', %Q{
  As an administrator
  I want to see how many students are enrolled in each course for a given semester
  So that I know how many students are taking each course
} do

  # ACCEPTANCE CRITERIA
  # * I must be able to see a list of all semesters
  # * When I click on a specfic semester I should see a list of all courses that are in that semester
  # * I should be able to see corresponding enrollment counts for each course

  let(:user)          { FactoryGirl.create(:user, role: 'Administrator') }
  let!(:semester1)    { FactoryGirl.create(:semester) }
  let!(:semester2)    { FactoryGirl.create(:semester, name: 'Spring 2013') }

  let!(:course1)      { FactoryGirl.create(:course, semester_id: semester1.id) }
  let!(:course2)      { FactoryGirl.create(:course, semester_id: semester1.id) }
  let!(:course3)      { FactoryGirl.create(:course, semester_id: semester2.id) }

  let!(:enrollment1)  { FactoryGirl.create(:enrollment, student_id: 1, course_id: course1.id) }
  let!(:enrollment2)  { FactoryGirl.create(:enrollment, student_id: 2, course_id: course1.id) }
  let!(:enrollment3)  { FactoryGirl.create(:enrollment, student_id: 3, course_id: course1.id) }
  let!(:enrollment4)  { FactoryGirl.create(:enrollment, student_id: 4, course_id: course2.id) }
  let!(:enrollment5)  { FactoryGirl.create(:enrollment, student_id: 5, course_id: course2.id) }
  let!(:enrollment6)  { FactoryGirl.create(:enrollment, student_id: 6, course_id: course2.id) }
  let!(:enrollment7)  { FactoryGirl.create(:enrollment, student_id: 7, course_id: course2.id) }
  let!(:enrollment8)  { FactoryGirl.create(:enrollment, student_id: 8, course_id: course2.id) }
  let!(:enrollment9)  { FactoryGirl.create(:enrollment, student_id: 9, course_id: course3.id) }

  scenario 'If I click a course title I can see the average grade for that course' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_link 'Profile'
    click_link 'View Semesters'
    click_link course1.semester.name

    expect(page).to have_content(course1.title)
    expect(page).to have_content(course2.title)
    expect(page).to have_content(course1.enrollments.count)
  
    expect(page).to_not have_content(course3.title)

  end
end
