class PagesController < ApplicationController

  # If logged in build the woof feed
  # Feed items are generated via paginate
  def home
      if logged_in?
        @woof  = current_user.woofs.build
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    @user = User.new
  end

  def contact
  end

  def about
  end

  # Title sets dynamic title on each page
  # Users paginate to generate user lists based on feed / following / followers
  
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

end
