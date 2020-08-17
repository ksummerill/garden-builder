class Garden < ApplicationRecord
  belongs_to :gardener
  has_many :plants
end
