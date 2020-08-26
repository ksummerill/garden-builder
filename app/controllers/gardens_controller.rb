class GardensController < ApplicationController
  before_action :get_gardener
  # before_action :set_garden, only: [:show, :edit, :update, :destroy]


  # creates a garden object that’s associated with the specific Gardener instance from the get_gardener method
  def new
    @garden = @gardener.gardens.build
  end

  # create garden and associate with the current_user
  def create
    @garden = @gardener.gardens.build(garden_params)
      if @garden.save
         redirect_to gardener_path(@gardener), notice: 'Garden was successfully created.'
      else
        render :new
      end
  end

  # return all garden instances associated with a particular gardener instance
  def show
    @garden = Garden.find(params[:id])
  end

  private

  def get_gardener
    @gardener = Gardener.find(params[:gardener_id])
  end

  # finds a matching id of a garden in a collection of gardens owned by a particular gardener
  def set_garden
    @garden = @gardener.gardens.find_by(params[:id])
  end

  def garden_params
    params.require(:garden).permit(:name, :variety)
  end

end
