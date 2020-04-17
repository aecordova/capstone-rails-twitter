class ChangeColumnNamesOnUsersPostsAndFollowing < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :full_name
    rename_column :posts, :user_id, :author_id
    rename_column :posts, :content, :text
    rename_column :user_follows, :user_id, :follower_id
    rename_column :user_follows, :followed_user_id, :followed_id

    rename_table :user_follows, :followings
  end
end
