class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :key_memory, dependent: :destroy
  belongs_to :babies, through: :key_memories
  has_many :comments, dependent: :destroy
end
