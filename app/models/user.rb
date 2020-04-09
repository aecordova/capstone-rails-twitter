class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :follows, class_name: 'UserFollow'
  has_many :followed_users, through: :follows, source: :followed_user

  def timeline_posts
    Post.where("user_id IN (?)", follow_list << id).newest_first
  end

  def follow(user_to_follow_id)
    UserFollow.create_follower(id, user_to_follow_id)
  end

  def follow_list
    follows.map { |f| f.followed_user_id }
  end

end
