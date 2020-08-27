class PlantsController < ApplicationController
  before_action :get_garden
  before_action :get_plant, only: [:show]

  # creates a plant object that’s associated with the specific garden instance from the get_garden method
  def new
    @plant = @garden.gardener.plants.build
  end

  def create
    @plant = @garden.plants.build(plant_params)
      if @plant.save
         redirect_to garden_path(@garden), notice: 'You successfully planted a plant!'
      else
        render :new
      end
  end

  def show

  end

  private

  def get_plant
    @plant = Plant.find(params[:id])
  end

  def get_garden
    @garden = Garden.find(params[:garden_id])
  end

  # finds a matching id of a garden in a collection of gardens owned by a particular gardener
  def set_garden
    @garden = Garden.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :amount_of_sun, :water_frequency, :category)
  end

end
