class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  def self.mk_follower(follower_id, followed_id)
    raise 'error' && return if where(follower_id: follower_id, followed_id: followed_id).exists?

    create(follower_id: follower_id, followed_id: followed_id)
  end

  def self.rm_follower(follower_id, followed_id)
    return unless where(follower_id: follower_id, followed_id: followed_id).exists?

    delete(find_by(follower_id: follower_id, followed_id: followed_id))
  end
end
