class Post < ApplicationRecord
  belongs_to :user

  scope :newest_first, ->{ order('created_at desc') }
end
