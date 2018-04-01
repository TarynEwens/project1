class PagesController < ApplicationController
  def home
    @woof = current_user.woofs.build if logged_in?
  end

  def contact
  end

  def about
  end

end
