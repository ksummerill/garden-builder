class Plant < ApplicationRecord
  belongs_to :garden
  has_many :notes
end
