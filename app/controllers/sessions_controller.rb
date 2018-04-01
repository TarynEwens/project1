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
      redirect_to @user
    # else
    else
      flash[:danger] = "Invalid email or password"
      # send them to the login page again
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
