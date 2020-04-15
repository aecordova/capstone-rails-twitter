require 'rails_helper'

RSpec.feature 'Guest signs up' do
  scenario 'Guest visits signup page' do
    visit signup_path
    expect(page).to have_content('Login')
    expect(page).to have_content('Welcome')
    expect(page).to have_content('Already have an account?')
  end

   scenario 'Guest visits login page' do
     visit login_path
     expect(page).to have_content('Want to create a new Account?')
    expect(page).to have_content('Sign Up')
  end

   scenario 'with valid information' do
     sign_up_with 'user', 'user@email.com', '123456', '123456'
     expect(page).to have_content('Log Out')
   end

   scenario 'with missing information' do
     sign_up_with '', '', '', ''
     expect(page).to have_content("Username can't be blank")
     expect(page).to have_content("Password can't be blank")
     expect(page).to have_content("Email can't be blank")
   end

   scenario 'with invalid information' do
     sign_up_with 'a' * 52, 'email@', '123', '123'
     expect(page).to have_content('Username is too long')
     expect(page).to have_content('Email is invalid')
     expect(page).to have_content('Password is too short')
   end
end

 def sign_up_with(username, email, password, password_conf)
   visit signup_path
   fill_in 'username', with: username
   fill_in 'email', with: email
   fill_in 'password', with: password
   fill_in 'confirm password', with: password_conf
   click_button 'Sign Up!'
 end

