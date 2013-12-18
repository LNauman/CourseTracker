# require 'spec_helper'

# feature 'student can view their gpa', %Q{
# As a student
# I want to see my GPA for a given semester
# So that I know how I'm doing
# } do

#   # ACCEPTANCE CRITERIA
#   #* I must be able to specificy a semester
#   #* I must be provided with my GPA for the given semester
  
#   let(:user)        { FactoryGirl.create(:user, role: 'Student') }
#   let(:semester)    { FactoryGirl.create(:semester) }
#   let(:course3)     { FactoryGirl.create(:course, semester_id: semester.id, credits: 2) }
#   let(:course4)     { FactoryGirl.create(:course, semester_id: semester.id, credits: 3) }
#   let(:course5)     { FactoryGirl.create(:coure, semester_id: (semester.id + 1), credits: 4) }
#   let(:enrollment1) { FactoryGirl.create(:enrollment, student_id: user.id, course_id: course3.id, grade: 3.5) }
#   let(:enrollment2) { FactoryGirl.create(:enrollment, student_id: user.id, course_id: course4.id, grade: 2.1) }
#   let(:enrollment3) { FactoryGirl.create(:enrollment, student_id: user.id, course_id: course5.id, grade: 1.2) }

#   scenario 'click on sgn out, logged out of account' do
#     visit root_path
#     click_link 'Sign In'

#     fill_in 'Email', with: user.email 
#     fill_in 'Password', with: user.password
#     click_button 'Sign in'
#     click_link 'Profile'
#     click_link

#     click_link 'View My GPA'
#     select 'Fall 2013', from: 'Semester'
#     click_button 'Submit'
    
#     expect(page).to have_content('GPA for #{semester.name}:')
#     expect(page).to have_content(2.66)

#     expect(page).to_not have_content(2.01)
#   end
# end