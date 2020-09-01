class Gardener < ApplicationRecord
  has_many :gardens
  has_many :plants, through: :gardens
  has_many :tasks, through: :gardens

  validates :username, uniqueness: true, presence: true

  has_secure_password
end
