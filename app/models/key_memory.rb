class KeyMemory < ApplicationRecord
  EVENTS = [
    "🤸Roll over",
    "🪑Sitting",
    "🐈 Crawling",
    "🧍Standing",
    "🚶Walking",
    "🚄 Travel",
    "🏖️ Beach",
    "🛴 Scooter",
    "⛇ Snow",
    "🛏️ Bed",
    "💼 School",
    ""
  ]

  belongs_to :memory
  belongs_to :baby
  validates :baby_id, presence: true
  validates :event, inclusion: { in: EVENTS }
end
