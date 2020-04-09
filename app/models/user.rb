class User < ApplicationRecord
  has_many :posts
  has_secure_password

  def timeline_posts
     
  end
end
