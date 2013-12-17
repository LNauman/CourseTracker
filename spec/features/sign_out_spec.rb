require 'spec_helper'

feature 'user signs out', %Q{
As a user
I want to sign out
So that I can end my session
} do

	# ACCEPTANCE CRITERIA
	#* I must click sign out
	#* I must be notified I have signed out successfully
	#* I must b redirected to the sign in page

	let(:user) { FactoryGirl.create(:user) }

	scenario 'click on sgn out, logged out of account' do
		visit root_path
		click_link 'Sign In'

		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		click_link 'Sign out'

		expect(page).to have_content('Signed out successfully.')
		expect(page).to have_content('Sign In')

		expect(page).to_not have_content('Sign Out')
	end
end