class GardensController < ApplicationController
  before_action :get_gardener, only: [:new, :create, :show]
  before_action :set_garden, only: [:show, :update]
  # before_action :current_user

  # creates a garden object that’s associated with the specific Gardener instance from the get_gardener method
  def new
    @garden = Garden.new
  end

  # create garden and associate with the current_user
  def create
    @garden = @gardener.gardens.build(garden_params)
    # @garden.id = params[:id]

      if @garden.save
         redirect_to gardener_path(@gardener)
         flash[:notice] = 'Garden was successfully created.'
      else
        flash.now[:notice] = @garden.errors.full_messages
        render :new
      end
  end

  # calls set_garden first to return all garden instances associated with a particular gardener instance
  # access to @plants should give you all plant objects associated with this garden
  # access to @tasks should give you all task objects associated with this garden

  def show
    @plants = @garden.plants.all.order(created_at: :asc)
    @tasks = @garden.tasks.all
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
    @gardener = current_user
  end

  # finds a matching id of a garden in a collection of gardens owned by a particular gardener
  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :variety)
  end

end
