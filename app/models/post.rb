class Post < ApplicationRecord
  belongs_to :user
  
  has_many :post_likes
  has_many :likers, through: :post_likes, source: :post

  scope :newest_first, ->{ order('created_at desc') }
end
