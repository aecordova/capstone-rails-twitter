class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.like_post(user_id, post_id)
    return if where(user_id: user_id, post_id: post_id).exists?

    create(user_id: user_id, post_id: post_id)
  end

  def self.unlike_post(user_id, post_id)
    return unless where(user_id: user_id, post_id: post_id).exists?

    delete(find_by(user_id: user_id, post_id: post_id))
  end
end
