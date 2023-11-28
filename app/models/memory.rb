class Memory < ApplicationRecord
  belongs_to :user
  has_many :key_memory, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :babies, through: :key_memories
  has_many_attached :photos
  validates :date, :title, :content, :location, :user_id, presence: true
  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 10 }
end
