class Post < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: {maximum:150}
  
  has_many :post_likes
  has_many :likers, through: :post_likes, source: :user
  has_many :comments

  scope :newest_first, ->{ order('created_at desc') }

  def like_ct
    post_likes.count
  end

  def comment_ct
    comments.count
  end
end
