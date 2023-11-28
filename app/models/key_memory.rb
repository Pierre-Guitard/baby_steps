class KeyMemory < ApplicationRecord
  belongs_to :memory
  belongs_to :baby
  validates :event, :memory_id, :baby_id, presence: true
end
