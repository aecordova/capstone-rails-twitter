class AddMoreFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :bio, :text
    add_column :users, :birth_date, :datetime
    add_column :users, :location, :string
    add_column :users, :password_digest, :string
  end
end
