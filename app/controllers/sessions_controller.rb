class SessionsController < ApplicationController
  def welcome
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
