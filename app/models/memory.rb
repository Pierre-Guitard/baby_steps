class Memory < ApplicationRecord
  belongs_to :user
  has_many :key_memory, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :babies, through: :key_memories
  has_many_attached :photos
end
