class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :if_not_logged_in_redirect, :options_for_select

    # method for checking current_user
    def current_user
      if session[:gardener_id].present?
        gardener = Gardener.find_by(:id => session[:gardener_id])
      end
    end

    # if user isn't logged in, redirect to root url
    def logged_in?
      !!session[:gardener_id]
    end

    def if_not_logged_in_redirect
      redirect_to root_path if !logged_in?
    end

    # want to exclude showing the navigation bar on root, signup and login
    # def show_nav?
    #   if !current_page?(root_path)
    #     render 'shared/nav_menu'
    #   end
    # end
end
