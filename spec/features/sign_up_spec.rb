require 'spec_helper'

feature 'user signs up', %Q{
  As an unauthenticated user
  I want to sign up
  So that I can make changes and view other lists
} do

# Acceptance Criteria: 
# * I must specify a valid email address
# * I must specify a password, and confirm that password
# * If I do not perform the above, I get an error message
# * If I specify valid information, I register my account and am authenticated

  scenario 'specify valid and required information' do
    visit root_path
    click_link 'Sign Up'
    
    fill_in 'Email', with: 'user@example.com'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    select 'Student', from: 'Role' 
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign out")

    expect(page).to_not have_content("Sign up")
    expect(page).to_not have_content("Sign in")
  end
    
  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not  have_content("Sign out")
  end

  scenario 'password confirmation does not match password' do
    visit root_path
    click_link 'Sign Up'
    
    fill_in 'Email', with: 'user@example.com'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    select 'Student', from: 'Role' 
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'differentpassword'

    click_button 'Sign up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign out")
  end  
end