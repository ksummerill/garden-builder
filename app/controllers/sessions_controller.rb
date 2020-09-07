class SessionsController < ApplicationController
  def welcome
  end

  def new
  end

  def create
    # login with Github
    # email from request.env["omniauth.auth"] is returning nil, using username instead
    if auth_hash = request.env["omniauth.auth"]
      gardener = Gardener.find_or_create_by_omniauth(auth_hash)
      session[:gardener_id] = gardener.id

      redirect_to gardener_path(gardener)
    else
      # login with username/pw
      gardener = Gardener.find_by(username: params[:username])
      if gardener && gardener.authenticate(params[:password])
        session[:gardener_id] = gardener.id
        redirect_to gardener_path(gardener)
      else
        render :new
      end
    end
  end

  def destroy
    session.delete(:gardener_id)
    redirect_to '/'
  end
end
