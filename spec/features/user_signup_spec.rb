require 'rails_helper'

RSpec.describe 'Signing up on the platform', type: :feature do
  describe 'when a user visits the signup page' do
    it 'should display options for signing up via social media accounts' do
      visit signup_path

      expect(page).to have_content('SIGN UP')
      expect(page).to have_content('BE COOL! SIGN UP WITH THESE:')
      expect(page).to have_content('facebook')
      expect(page).to have_content('twitter')
      expect(page).to have_content('github')
    end

    it 'should display an email / password form
  when the user opts to signup via that option', js: true do
      visit signup_path

      expect(page).not_to have_selector('input#user_fullname')
      expect(page).not_to have_selector('input#user_email')
      expect(page).not_to have_selector('input#user_password')

      expect(page).to have_content('be cool! sign up with these:')
      expect(page).to have_content('Or sign up with your Email')
      find('.show-main-form').click
      expect(page).not_to have_content('be cool! sign up with these:')
      expect(page).to have_selector('input#user_fullname')
      expect(page).to have_selector('input#user_email')
      expect(page).to have_selector('input#user_password')
    end

    it 'the signup page should contain a link to the login page' do
      visit signup_path

      expect(page).to have_content('Already have an account? Login')
      click_link 'Login'
      expect(page).to have_content('LOG IN')
    end
  end
end
