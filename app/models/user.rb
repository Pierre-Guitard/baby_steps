class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :memories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :babies, through: :parents
  has_many :parents, dependent: :destroy
  validates :email, presence: true
  has_one_attached :avatar
end
