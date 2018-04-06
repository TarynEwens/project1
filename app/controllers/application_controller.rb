class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :fetch_user

  private
  # Before any action fetch the user params and store in @current_user
  def fetch_user
    @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
    session[:user_id] = nil unless @current_user.present? # This prevents horrors if you reseed.
  end

  # Confirms a logged-in user.
  def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
  end

end
