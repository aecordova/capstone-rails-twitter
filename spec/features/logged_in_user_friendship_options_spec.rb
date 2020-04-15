require 'rails_helper'

RSpec.feature 'Logged in user can : Follow/Unfollow other users' do
  background do
    u = User.create(username: 'user_one', email: 'user_one@email.com', password: '123456')
    User.create(username: 'user_two', email: 'user_two@email.com', password: '123456')
    u.posts.create(content: 'I am user_one and This is my first post')
  end

  scenario 'User can follow another user' do
    login_with '@user_one', '123456'
    click_on '@user_two'
    within '.profile-data' do
      click_on 'Follow'
    end
    expect(page).to have_content('> Profile')
    expect(page).to have_button('Following')
  end

  scenario 'User is able to see posts from the people he follows' do
    login_with '@user_two', '123456'
    click_on '@user_one'
    within '.profile-data' do
      click_on 'Follow'
    end
    expect(page).to have_content('I am user_one and This is my first post')
  end
end

def login_with(username, password)
  visit login_path
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Log In!'
end
