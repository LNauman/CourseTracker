# require 'spec_helper'

# feature 'teacher and admin can import enrollments', %Q{
# As a teacher or administrator
# I want to be able to import enrollments 
# So that enrollment lists are  current
# } do

#   # ACCEPTANCE CRITERIA
#   # * I should be able to import enrollments to a course
#   # * I should be able to see the new enrolllments I have imported
#   # * A student should not be able to import enrollments

#   let(:user)                   { FactoryGirl.create(:user, role: 'Teacher') }
#   let!(:user1)               { FactoryGirl.create(:user, role: 'Student') }
#   let!(:user2)               { FactoryGirl.create(:user, role: 'Student') }
#   let!(:course)             { FactoryGirl.create(:course, teacher_id: user.id, title: 'Tester Title') }
#   let!(:enrollment1)   { FactoryGirl.create(:enrollment, student_id: user1.id, course_id: course.id) }
#   let!(:enrollment2)   { FactoryGirl.create(:enrollment, student_id: user2.id, course_id: course.id) }

#   scenario 'uploads correct file type, enrollments imported' do 
#     visit root_path
#     click_link 'Sign In'

#     fill_in 'Email', with: user.email
#     fill_in 'Password', with: user.password
#     click_button 'Sign in'
#     visit "/courses/#{course.id}"

#     page.should have_content('Course Roster')
#     page.attach_file('') #???? how do i do this??

#   end

#   scenario 'uploads incorrect file type, gets error message'

#   scenario 'clicks import without uploading a file, gets error message'

#   scenario ' student tries to go to page, gets redirected and an error message'
# end
