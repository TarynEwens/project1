class PagesController < ApplicationController
  def home
      if logged_in?
        @woof  = current_user.woofs.build
        @feed_items = current_user.feed.paginate(page: params[:page])
      end  
  end

  def contact
  end

  def about
  end

end
