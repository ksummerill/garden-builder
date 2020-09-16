class PlantsController < ApplicationController
  before_action :get_garden, only: [:new, :create, :show, :edit, :update]
  before_action :get_plant, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?
  before_action :current_user

  def index
    # binding.pry
    @plants = Plant.popular_plants.count
  end

  # creates a plant object that’s associated with the specific garden instance from the get_garden method
  def new
    @plant = @garden.gardener.plants.build
  end

  def create
    @plant = @garden.plants.build(plant_params)

      if @plant.save
         redirect_to garden_path(@garden)
      else
        flash[:notice] = @plant.errors.full_messages
        render :new
      end
  end

  def show
  end

  # if the current user owns this plant, then allow edit page to render
  # otherwise, throw error and do not render page
  def edit
    # grab garden's id and set it equal to this_garden
    @this_garden = @garden.id
  end

  def update
    if @plant.update(plant_params)
      redirect_to garden_path(@garden)
    else
      flash[:notice] = @plant.errors.full_messages
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

  def plant_params
    params.require(:plant).permit(:name, :amount_of_sun, :water_frequency, :category)
  end

end
