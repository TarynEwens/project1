class UsersController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
   before_action :correct_user, only: [:edit, :update]

   # User paginate to generate users feed page (show all users )
  def index
    @users = User.paginate(page: params[:page])
  end

  # New User Page (sign up)
  def new
    @user = User.new
    session[:message] = 'Hello there'
  end

  # Create User
  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Welcome to WOOFER - Please update your profile before continuing!"
      redirect_to edit_user_path(@user) # it worked!
    else
      render :new
    end
  end

  # Edit User Page
  def edit
    @user = User.find params[:id]
  end

  # Update user - uses cloudinary to upload an image and then updates user params and updates image to the cloudinary url
  # Update user params MUST be before cloudinary url update
  def update
  user = User.find params[:id]
  cloudinary = Cloudinary::Uploader.upload( params[ "user" ][ "image" ] )
  user.update user_params
  user.update :image => cloudinary["url"]
  redirect_to user_path
  end


  # Show users page - woofs generates list of woofs via paginate
  def show
    @user = User.find params[:id]
    @woofs = @user.woofs.paginate(page: params[:page])
  end

  # Set up user following page - uses paginate to generate list of following users
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  # Set up user following page - uses paginate to generate list of follower users
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end




  # Delete User Account
  def destroy
   User.find(params[:id]).destroy
   # flash[:success] = "User deleted"
   redirect_to root_url
 end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :bio, :image, :location, :dob, :session)
  end

  # Before filters

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms the admin user
  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end


end
