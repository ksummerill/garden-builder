class PlantsController < ApplicationController
  before_action :get_garden
  # creates a plant object that’s associated with the specific garden instance from the get_garden method
  def new
    @plant = @garden.plant.build
  end

  private

  def get_garden
    @garden = Garden.find(params[:garden_id])
  end

  # finds a matching id of a plant in a collection of gardens owned by a particular gardener
  def set_garden
    @garden = Garden.find(params[:id])
  end

  def plant_params
    params.require(:garden).permit(:name, :variety)
  end

end
