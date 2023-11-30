class Memory < ApplicationRecord
  belongs_to :user
  has_many :key_memories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :babies, through: :key_memories
  has_rich_text :content
  has_many_attached :photos
  validates :date, :title, :user_id, :location, presence: true
  validates :title, length: { minimum: 4 }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
