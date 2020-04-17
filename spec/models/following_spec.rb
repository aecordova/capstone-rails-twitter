require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'Associations' do
    it { should belong_to :followed }
    it { should belong_to :follower }
  end

  describe 'Validations' do
    it { should validate_presence_of :followed_id }
    it { should validate_presence_of :follower_id }
  end

  let(:user1) do
    User.create(username: '@user_1', email: 'user_1@email.com',
                password: '123456', password_confirmation: '123456')
  end

  let(:user2) do
    User.create(username: '@user_2', email: 'user_2@email.com',
                password: '123456', password_confirmation: '123456')
  end

  it 'should be able to make followers' do
    expect { Following.mk_follower(user1.id, user2.id) }.to change { user2.follower_ct }.by(1)
  end

  it 'should be able to remove followings' do
    user1.follow user2.id
    expect { Following.rm_follower(user1.id, user2.id) }.to change { user2.follower_ct }.by(-1)
  end
end
