require 'spec_helper'

feature 'student can view their gpa', %Q{
As a student
I want to see my GPA for a given semester
So that I know how I'm doing
} do

  # ACCEPTANCE CRITERIA
  # * I must be able to specificy a semester
  # * I must be provided with my GPA for the given semester
  
  let(:user)         { FactoryGirl.create(:user, role: 'Student') }
  let!(:semester)    { FactoryGirl.create(:semester) }
  let!(:course1)     { FactoryGirl.create(:course, semester_id: semester.id) }
  let!(:course2)     { FactoryGirl.create(:course, semester_id: semester.id) }
  let!(:course3)     { FactoryGirl.create(:course, semester_id: (semester.id + 1)) }
  let!(:enrollment1) { FactoryGirl.create(:enrollment, student_id: user.id, course_id: course1.id, grade: 3.0) }
  let!(:enrollment2) { FactoryGirl.create(:enrollment, student_id: user.id, course_id: course2.id, grade: 3.5) }
  let!(:enrollment3) { FactoryGirl.create(:enrollment, student_id: user.id, course_id: course3.id, grade: 4.0) }

  scenario 'If I click a semester I see my GPA for that course' do
    visit root_path
    click_link 'Sign In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    click_link 'Profile'

    visit "/semesters/#{semester.id}"

    expect(page).to have_content("Your GPA for #{course1.semester.name}: ")
    expect(page).to have_content(3.25)

    expect(page).to_not have_content(3.5)
    
  end
end