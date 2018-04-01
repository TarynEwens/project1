class PagesController < ApplicationController
  def home
    @woofs = Woof.all
  end

  def contact
  end

  def about
  end

end
