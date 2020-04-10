class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :follows, class_name: 'UserFollow'
  has_many :followed_users, through: :follows, source: :followed_user

  def timeline_posts
    Post.where("user_id IN (?)", follow_list << id).newest_first
  end

  def follow(user_id)
    return unless User.where(id: user_id).exists?

    UserFollow.mk_follower(id, user_id)
  end

  def follows?(user_id)
    follows.where(followed_user_id: user_id).exists?
  end

  def unfollow(user_id)
    return unless User.where(id: user_id).exists?

    UserFollow.rm_follower(id, user_id)
  end

  def follow_list
    follows.map { |f| f.followed_user_id }
  end

end
