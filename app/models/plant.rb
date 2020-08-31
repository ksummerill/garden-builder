class Plant < ApplicationRecord
  belongs_to :garden
  has_many :tasks
end
