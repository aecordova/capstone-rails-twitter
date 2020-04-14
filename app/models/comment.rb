class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  scope :newest_first, ->{ order('created_at desc') }


end
