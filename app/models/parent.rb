class Parent < ApplicationRecord
  belongs_to :baby
  belongs_to :user
  validates :baby_id, :user_id, presence: true
end
