class User < ApplicationRecord
  has_many :reservations, foreign_key: 'user_id'
  has_many :owned_restaurants, class_name: 'Restaurant', foreign_key: 'user_owner_id'
  has_many :restaurants, through: :reservations
  has_many :reviews

  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
