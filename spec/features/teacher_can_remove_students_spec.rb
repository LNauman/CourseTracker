# require 'spec_helper'

# feature 'Teacher can remove students from a course', %Q{
#   As a teacher
#   I want to be able to remove a student that has dropped out of my class
#   So that my records are accurate
# } do

#   # ACCEPTANCE CRITERIA
#   # * I must be able to click a remove button next to a students name
#   # * When I click on the remove button the student's record is removed from that course

#   let(:user1)         { FactoryGirl.create(:user, role: 'Teacher') }
#   let(:user2)         { FactoryGirl.create(:user, role: 'Student', id: 4) }
#   let!(:semester)     { FactoryGirl.create(:semester) }
#   let!(:course1)      { FactoryGirl.create(:course, teacher_id: user1.id, semester_id: semester.id) }
#   let!(:enrollment1)  { FactoryGirl.create(:enrollment, student_id: 4, course_id: course1.id) }
#   let!(:enrollment2)  { FactoryGirl.create(:enrollment, student_id: 3, course_id: course1.id) }

#   scenario "If I click 'remove' I can delete a student's record from my class" do
#     visit root_path
#     click_link 'Sign In'

#     fill_in 'Email', with: user1.email
#     fill_in 'Password', with: user1.password
#     click_button 'Sign in'
    
#     visit "/courses/#{course1.id}"

#     click_link 'Remove'

#     expect(page).to have_content("Student has been removed successfully")
  
#     expect(page).to_not have_content(user2.first_name)
#   end 

#   scenario "If I am signed in as a student I cannot remove other students" do
#     visit root_path
#     click_link  'Sign In'
  
#     fill_in 'Email', with: user2.email
#     fill_in 'Password', with: user2.password
#     click_button 'Sign in'
#     click_link 'View Courses'

#     visit "/courses/#{course1.id}"

#     click_link 'Remove'

#     expect(page).to have_content("Not authorized to edit")
#     expect(page).to have_content('Remove')

#     expect(page).to_not have_content("Student has been removed successfully")
#   end
# end
