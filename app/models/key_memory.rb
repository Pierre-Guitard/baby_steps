class KeyMemory < ApplicationRecord
  belongs_to :memory
  belongs_to :baby
  validates :memory_id, :baby_id, presence: true
end
