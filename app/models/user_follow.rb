class UserFollow < ApplicationRecord
  belongs_to :user 
  belongs_to :followed_user, class_name: 'User'

  def self.create_follower(user_id, user_to_follow_id)
    create(user_id: user_id, followed_user_id: user_to_follow_id)
  end
end
