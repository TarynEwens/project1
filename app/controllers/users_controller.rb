class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    session[:message] = 'Hello there'
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path # it worked!
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update user_params
    redirect_to user_path
  end

  def show
    @user = User.find params[:id]
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :bio, :image, :location, :dob)
  end

end
