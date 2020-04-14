class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, length: { in: 3..31 }, uniqueness: true
  validates :email, presence: true

  has_many :posts
  has_many :post_likes
  has_many :liked_posts, through: :post_likes, source: :post

  has_many :comments

  has_many :follows, class_name: 'UserFollow'
  has_many :followed_users, through: :follows, source: :followed_user
  has_many :followers, through: :follows, source: :user


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
    follows.map(&:followed_user_id)
  end

  def follower_ct 
    followers.count
  end

  def like(post_id)
    return unless Post.where(id: post_id).exists?

    PostLike.like_post(id, post_id) 
  end

  def unlike(post_id)
    return unless Post.where(id: post_id).exists?

    PostLike.unlike_post(id, post_id)
  end

  def likes?(post_id)
    post_likes.where(post_id: post_id).exists?
  end

  def comment(post_id, comment)
    comments.build(post_id, comment)
  end
end
