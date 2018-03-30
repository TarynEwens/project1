class WoofsController < ApplicationController

  def index
    @woofs = Woof.all
  end

  def new
    @woof = Woof.new
    @user_id = params[:user_id]
  end

  def create
    woof = @current_user.woofs.create woof_params
    redirect_to root_path
  end

  def edit
    @woof = Woof.find params[:id]
  end

  def update
    woof = Woof.find params[:id]
    woof.update woof_params
    redirect_to root_path
  end

  def show
    @woof = Woof.find params[:id]
  end

  def destroy
    woof = Woof.find params[:id]
    woof.destroy
    redirect_to root_path
  end


  private
  def woof_params
    params.require(:woof).permit(:status, :user_id, :image)
  end
end