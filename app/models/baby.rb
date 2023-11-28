class Baby < ApplicationRecord
  has_many :parents
  has_many :users, through: :parents
  has_many :key_memories, dependent: :destroy
  has_many :memories, through: :key_memories
  validates :first_name, presence: true
end
