class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, presence: true

  # def self.my_plants(session)
  #   @gardener = Gardener.find(session[:gardener_id])
  #   @my_plants = @gardener.gardens.plants
  # end

end
