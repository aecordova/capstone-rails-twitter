module UsersHelper
  def conditions_to_follow?(user)
    !(current_user == user || current_user.follows?(user))
  end
end
