class Gardener < ApplicationRecord
  has_many :gardens
  has_many :plants, through: :gardens
  has_many :notes
end
