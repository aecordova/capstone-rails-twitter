class CreateUserFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :user_follow do |t|
      t.integer :user_id
      t.integer :followed_user_id
      
      t.timestamps
    end
  end
end
