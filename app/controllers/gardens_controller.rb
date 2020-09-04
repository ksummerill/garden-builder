class GardensController < ApplicationController
  before_action :get_gardener, only: [:new, :create]
  before_action :set_garden, only: [:show, :edit, :update, :destroy]


  # creates a garden object that’s associated with the specific Gardener instance from the get_gardener method
  def new
    @garden = Garden.new
  end

  # create garden and associate with the current_user
  def create
    # binding.pry
    @garden = @gardener.gardens.build(garden_params)
      if @garden.save
         redirect_to gardener_path(@gardener)
         flash[:notice] = 'Garden was successfully created.'
      else
        flash[:notice] = @garden.errors.full_messages
        render :new
      end
  end

  # calls set_garden first to return all garden instances associated with a particular gardener instance
  # access to @plants should give you all plant objects associated with this garden
  # access to @tasks should give you all task objects associated with this garden

  def show
    # binding.pry
    @plants = @garden.plants.all
    @tasks = @garden.tasks.all
  end

  def edit
  end

  def update
    if @garden.update(garden_params)
      redirect_to gardener_garden_path(@gardener), notice: 'Garden was successfully updated.'
    else
      render :edit
    end
  end

  private

  def get_gardener
    @gardener = Gardener.find(params[:gardener_id])
  end

  # finds a matching id of a garden in a collection of gardens owned by a particular gardener
  def set_garden
    # @garden = @gardener.gardens.find_by(params[:id])
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :variety)
  end

end
