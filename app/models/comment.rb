class Comment < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  validates :content, presence: true, length: { maximum: 70 }
end
