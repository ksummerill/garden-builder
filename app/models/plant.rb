class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, presence: true

  # query to return all plants that belong to a specific gardener (who's logged in)
  scope :search_plants, -> {joins(:garden).where(garden_id: 10).where(variety: "herb")}
    # .group(:id).order('created_at desc')}

end
