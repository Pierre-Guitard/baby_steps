class Baby < ApplicationRecord
  has_many :parents
  has_many :users, through: :parents
  has_many :key_memories, dependent: :destroy
  has_many :memories, through: :key_memories
  validates :first_name, :last_name, :nickname, :birth_date, :sex, presence: true
  has_one_attached :avatar

  def age_with_month(memory)
    time_diff = Time.diff(memory.date, birth_date)
    format_age(time_diff)
  end

  private
  def format_age(time_diff)
    if time_diff[:year] < 1
      "#{time_diff[:month]} month"
    elsif time_diff[:year] >= 1 && time_diff[:month]  != 0
      "#{time_diff[:year]} years #{time_diff[:month]} month"
    elsif time_diff[:month] == 0
      "#{time_diff[:year]} years"
    end
  end
end
  