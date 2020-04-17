require 'rails_helper'

RSpec.describe PostLike, type: :model do
  describe 'Associations' do
    it { should belong_to :user }
    it { should belong_to :post }
  end

  describe 'Validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :post_id }
  end

  let(:user1) do
    User.create(username: '@user_1', email: 'user_1@email.com',
                password: '123456', password_confirmation: '123456')
  end

  let(:post1) do
    user1.posts.create(text: 'Hello World!')
  end

  it 'should be able to make likes' do
    expect { PostLike.like_post(user1.id, post1.id) }.to change { post1.like_ct }.by(1)
  end

  it 'should be able to remove likes' do
    user1.like post1.id
    expect { PostLike.unlike_post(user1.id, post1.id) }.to change { post1.like_ct }.by(-1)
  end
end
