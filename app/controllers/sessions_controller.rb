class SessionsController < ApplicationController
  def welcome
  end

  def new
  end

  def create
    gardener = Gardener.find_by(username: params[:username])
    if gardener && gardener.authenticate(params[:password])
      session[:gardener_id] = gardener.id
      redirect_to gardener_path(gardener)
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
