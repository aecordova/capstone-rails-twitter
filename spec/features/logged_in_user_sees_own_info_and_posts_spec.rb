require 'rails_helper'

RSpec.feature 'Logged in user can see other users:' do
  background do
    u = User.create(username: '@user_one', email: 'user_one@email.com', password: '123456')
    User.create(username: '@user_two', email: 'user_two@email.com', password: '123456')
    User.create(username: '@user_three', email: 'user_three@email.com', password: '123456')
    u.posts.create(content: 'This is my first post')
  end

  scenario 'User is redirected to Home Page when logged in' do
    login_with '@user_one', '123456'
    expect(page).to have_content('> Home')
    expect(page).to have_content('Welcome to SayIt!')
  end

  scenario 'User is able to see unfollowed users in the Who to Follow Section' do
    login_with '@user_one', '123456'
    click_link('Profile')
    expect(page).to have_content('> Profile')
    expect(page).to have_content('@user_two')
    expect(page).to have_content('@user_three')
  end

  scenario 'User is able to see his own posts in his profile' do
    login_with '@user_one', '123456'
    click_link('Profile')
    expect(page).to have_content('> Profile')
    expect(page).to have_content('This is my first post')
  end
end

def login_with(username, password)
  visit login_path
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Log In!'
end
