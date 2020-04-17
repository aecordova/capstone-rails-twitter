require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    it { should have_secure_password }
    it { should have_many :posts }
    it { should have_many :comments }
    it { should have_many :followed_users }
    it { should have_many :followers }
  end

  describe 'Validations' do
    subject do
      User.create(username: '@user_1', email: 'user_1@email.com',
                  password: '123456', password_confirmation: '123456')
    end

    it { should validate_presence_of :username }
    it { should validate_uniqueness_of(:username).ignoring_case_sensitivity }
    it { should validate_length_of(:username).is_at_most(51) }
    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_length_of(:email).is_at_most(100) }
    it { should_not allow_values('email', '@email.com', 'user@email', '.com').for(:email) }
  end

  describe 'Class Methods' do
    let(:user1) do
      User.create(username: '@user_1', email: 'user_1@email.com',
                  password: '123456', password_confirmation: '123456')
    end

    let(:user2) do
      User.create(username: '@user_2', email: 'user_2@email.com',
                  password: '123456', password_confirmation: '123456')
    end

    let(:user3) do
      User.new(username: '@user_3', email: 'user_3@email.com',
               password: '123456', password_confirmation: '123456')
    end

    let(:post1) do
      user1.posts.create(text: 'Hello World!')
    end

    it 'should be able to follow users' do
      expect { user1.follow user2.id }.to change { user1.follows.count }.by(1)
    end

    it 'should be able to unfollow users' do
      user1.follow user2.id
      expect { user1.unfollow user2.id }.to change { user1.follows.count }.by(-1)
    end

    it 'should have recomendations of users to follow' do
      user3.save
      expect(user1.recommend_follows.count).to eq(1)
    end

    it 'should be able to check if follows another user' do
      user1.follow(user2.id)
      expect(user1.follows?(user2.id)).to be(true)
      expect(user1.follows?(user3.id)).to be(false)
    end

    it 'should be able to get the follower count' do
      user1.follow(user2.id)
      expect(user2.follower_ct).to eql(1)
    end

    it 'should be able to see followed users posts in his timeline' do
      user1.posts.create(text: 'Hello World!')
      user2.follow(user1.id)
      expect(user2.timeline_posts.count).to eql(1)
    end

    it 'should be able get the count of his posts' do
      user1.posts.create(text: 'Hello World!')
      expect(user1.post_ct).to eql(1)
    end

    it 'should be able like posts' do
      user2.like(post1.id)
      expect(post1.like_ct).to eql(1)
    end

    it 'should be able to check if likes a post' do
      user1.like(post1.id)
      expect(user1.likes?(post1.id)).to be(true)
    end
  end
end
