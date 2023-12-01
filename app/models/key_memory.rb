class KeyMemory < ApplicationRecord
  EVENTS = [
    "roll over",
    "sitting",
    "crawling",
    "standing",
    "walking",
    ""
  ]

  belongs_to :memory
  belongs_to :baby
  validates :memory_id, :baby_id, presence: true
  validates :event, inclusion: { in: EVENTS }
end
  