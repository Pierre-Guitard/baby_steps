class Comment < ApplicationRecord
  belongs_to :memory
  belongs_to :user
  validates :content, :memory_id, :user_id, presence: true
  validates :content, length: { minimum: 10 }
end
