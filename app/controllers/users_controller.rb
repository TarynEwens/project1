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
      flash[:success] = "Welcome to WOOFER!"
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
    @woofs = @user.woofs.paginate(page: params[:page])
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :bio, :image, :location, :dob)
  end

end
