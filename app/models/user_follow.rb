class UserFollow < ApplicationRecord
  belongs_to :user
  belongs_to :followed_user, class_name: 'User'

  def self.mk_follower(user_id, f_user_id)
    raise 'error' && return if where(user_id: user_id, followed_user_id: f_user_id).exists?

    create(user_id: user_id, followed_user_id: f_user_id)
  end

  def self.rm_follower(user_id, f_user_id)
    return unless where(user_id: user_id, followed_user_id: f_user_id).exists?

    delete(find_by(user_id: user_id, followed_user_id: f_user_id))
  end
end
