class Memory < ApplicationRecord
  belongs_to :user
  has_many :key_memories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :babies, through: :key_memories
  has_rich_text :content
  has_many_attached :photos
  validates :date, :title, :content, :user_id, :location, presence: true
  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 10 }
end
