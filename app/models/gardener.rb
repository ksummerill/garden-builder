class Gardener < ApplicationRecord
  has_many :gardens
  has_many :plants, through: :gardens
  has_many :tasks, through: :gardens

  validates :username, uniqueness: true, presence: true
  validates :first_name, :last_name, :email, presence: true
  validates :password, length: {in: 5..15}

  has_secure_password
end
