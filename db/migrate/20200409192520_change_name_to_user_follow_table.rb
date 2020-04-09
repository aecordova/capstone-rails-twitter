class ChangeNameToUserFollowTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_follow, :user_follows
  end
end
