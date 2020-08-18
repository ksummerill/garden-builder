class Gardener < ApplicationRecord
  has_many :gardens
  has_many :plants, through: :gardens
  has_many :notes

  validates :username, uniqueness: true, presence: true

  has_secure_password
end
