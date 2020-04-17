RSpec.describe Post, type: :model do
  describe 'Associations' do
    it { should have_many :post_likes }
    it { should have_many :likers }
    it { should belong_to :author }
  end

  describe 'Validations' do
    subject do
      Post.create(author_id: 1, text: 'Hello World!')
    end
    it { should validate_presence_of :text }
    it { should validate_length_of(:text).is_at_most(150) }
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

    let(:post1) do
      user1.posts.create(text: 'Hello World!')
    end

    it 'should be able get the count of its likes' do
      user1.like(post1.id)
      user2.like(post1.id)
      expect(post1.like_ct).to eql(2)
    end

    it 'should be able get the count of its comments' do
      Comment.create(user_id: user1.id, post_id: post1.id, comment: 'Comment1')
      Comment.create(user_id: user2.id, post_id: post1.id, comment: 'Comment2')
      expect(post1.comment_ct).to eql(2)
    end
  end
end
