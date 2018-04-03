class SessionsController < ApplicationController
  def new
  end

  def create
    # Find the user based on their email
    @user = User.find_by :email => params[:email]
    # If the password authenticates
    if @user.present? && @user.authenticate(params[:password])
      # Remember this user in the session
      log_in @user
      params[:remember_token] == '1' ? remember(@user) : forget(@user)
      redirect_back_or root_path
    # else
    else
      flash[:danger] = "Invalid email or password"
      # send them to the login page again
      redirect_to login_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end


end
