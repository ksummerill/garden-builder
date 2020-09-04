class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :show_nav?, :options_for_select

    # method for checking current_user
    def current_user
      if session[:gardener_id].present?
        gardener = Gardener.find_by(:id => session[:gardener_id])
      end
    end

    # if user isn't logged in, redirect to root url
    def logged_in?
      unless current_user
        redirect_to root_url
      end
    end

    # want to exclude showing the navigation bar on root, signup and login
    def show_nav?
      if !current_page?(root_path)
        render 'shared/nav_menu'
      end
    end
end
