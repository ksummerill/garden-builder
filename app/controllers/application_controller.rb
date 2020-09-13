class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :if_not_logged_in_redirect

    # method for checking current_user
    def current_user
      @gardener ||= Gardener.find_by_id(session[:gardener_id]) if session[:gardener_id]
    end

    # if user isn't logged in, redirect to root url
    def logged_in?
      !!session[:gardener_id]
    end

    def if_not_logged_in_redirect
      redirect_to root_path if !logged_in?
    end

end
