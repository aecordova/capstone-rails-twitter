require 'rails_helper'

RSpec.feature 'Vistor signs in' do
  background do
    User.create(name: '@user1', email: 'user1@email.com', password: '123456')
  end

  scenario 'with in-valid email and/or password' do
    sign_in_with 'noexist@email.com', '123'
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Please check your information and try again')
  end
end

def sign_in_with(username, password)
  visit login_path
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Log In!'
end
