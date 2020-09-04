class PlantsController < ApplicationController
  before_action :get_garden, only: [:new, :create, :show, :edit, :update]
  before_action :get_plant, only: [:show, :edit, :update, :destroy]

  # creates a plant object that’s associated with the specific garden instance from the get_garden method
  def new
    @plant = @garden.gardener.plants.build
  end

  def create
    # binding.pry
    @plant = @garden.plants.build(plant_params)
      if @plant.save
        @plant.id = params[:id]

         redirect_to garden_path(@garden)
         flash[:notice] = 'You successfully planted a plant!'
      else
        flash[:notice] = @plant.errors.full_messages
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      redirect_to garden_path(@garden), notice: 'Plant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @plant.destroy
    redirect_to garden_path(@plant.garden)
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
