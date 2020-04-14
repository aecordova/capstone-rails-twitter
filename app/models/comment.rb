class Comment < ApplicationRecord
  
  validates :comment, presence: true, length: { maximum: 150 } 

  belongs_to :post
  belongs_to :user

  scope :newest_first, ->{ order('created_at desc') }
  
end
