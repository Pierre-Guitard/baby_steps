class KeyMemory < ApplicationRecord
  EVENTS = [
    "Roll over",
    "Sitting",
    "Crawling",
    "Standing",
    "Walking",
    ""
  ]

  belongs_to :memory
  belongs_to :baby
  validates :memory_id, :baby_id, presence: true
  validates :event, inclusion: { in: EVENTS }
end
