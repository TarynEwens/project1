class PagesController < ApplicationController
  def home
    @woofs = Woof.all
  end


end
