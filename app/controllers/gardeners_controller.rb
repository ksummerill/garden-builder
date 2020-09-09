class GardenersController < ApplicationController
  before_action :logged_in?, except: [:new, :create]

  def new
    @gardener = Gardener.new
  end

  def create
    @gardener = Gardener.new(gardener_params)

    if @gardener.save
      session[:gardener_id] = @gardener.id
      redirect_to gardener_path(@gardener)
    else
      flash[:notice] = @gardener.errors.full_messages
      render :new
    end
  end

  def show
    if_not_logged_in_redirect
    @gardener = Gardener.find_by_id(params[:id])
    @gardens = @gardener.gardens.all
  end

  private

  def gardener_params
    params.require(:gardener).permit(:username, :email, :password, :first_name, :last_name)
  end
end
