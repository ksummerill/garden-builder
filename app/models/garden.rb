class Garden < ApplicationRecord
  belongs_to :gardener
  has_many :plants
  has_many :tasks, through: :plants
end
