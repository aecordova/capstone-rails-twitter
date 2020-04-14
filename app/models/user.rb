class User < ApplicationRecord
  before_save :downcase_email_username, :username_initial_at

  validates :username, presence: true, length: { in: 3..51 }, uniqueness: true

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :posts
  has_many :post_likes
  has_many :liked_posts, through: :post_likes, source: :post

  has_many :comments

  has_many :follows, class_name: 'UserFollow'
  has_many :followed_bys, class_name: 'UserFollow', foreign_key: 'followed_user_id'

  has_many :followed_users, through: :follows, source: :followed_user
  has_many :followers, through: :followed_bys, source: :user

  scope :most_recent, -> { order('created_at desc') }

  def recommend_follows
    User.where('id NOT IN (?)', (follow_list << id)).most_recent
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
    return [] unless follows.exists?

    follows.map(&:followed_user_id)
  end

  def follower_ct
    followers.count
  end

  def following_ct
    follows.count
  end

  def timeline_posts
    Post.where('user_id IN (?)', follow_list << id).newest_first
  end

  def post_ct
    posts.count
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

  private

  def downcase_email_username
    self.email = email.downcase
    self.username = username.downcase
  end

  def username_initial_at
    return if username[0] == '@'

    username.prepend('@')
  end
end
