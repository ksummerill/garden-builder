class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, presence: true

  # query to return all plants, grouped by name and counted to see which plants
  # have been planted the most
  scope :popular_plants, -> {group(:name).order('count(name) desc')}

end
