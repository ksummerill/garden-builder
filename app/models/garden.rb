class Garden < ApplicationRecord
  belongs_to :gardener
  has_many :plants
  has_many :tasks

  validates :name, :variety, presence: true

  # def valid_garden?
  #   if garden.valid?
  #
  # end
end
