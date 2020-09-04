class GardenersController < ApplicationController
  before_action :logged_in?, except: [:new, :create]

  def new
    @gardener = Gardener.new
  end

  def create
    @gardener = Gardener.new(gardener_params)
    if @gardener.valid?
      session[:gardener_id] = @gardener.id
      redirect_to gardener_path(@gardener)
    else
      flash[:notice] = @gardener.errors.full_messages
      render :new
    end
  end

  def show
    @gardener = current_user
    @gardens = @gardener.gardens
  end

  private

  def gardener_params
    params.require(:gardener).permit(:username, :password, :first_name, :last_name)
  end
end
