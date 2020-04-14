class Post < ApplicationRecord
  belongs_to :user
  
  has_many :post_likes
  has_many :likers, through: :post_likes, source: :user
  has_many :comments

  scope :newest_first, ->{ order('created_at desc') }

  def like_ct
    post_likes.count
  end
end
