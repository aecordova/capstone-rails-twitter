class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :content, :text
  end
end
