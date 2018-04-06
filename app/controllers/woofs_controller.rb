class WoofsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
   before_action :correct_user,   only: :destroy

  # Generates an index of all woofs on the website - not currently used
  def index
    @woofs = Woof.all
  end

  # Create a new woof page with form - not currently used
  def new
    @woof = Woof.new
    @user_id = params[:user_id]
  end

  # Create function for a new woof
  def create
    @woof = current_user.woofs.build(woof_params)
    if @woof.save
      flash[:success] = "Woof woofed!"
      redirect_to root_url
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  # Edit function for a woof - not currently used
  def edit
    @woof = Woof.find params[:id]
  end

  # Update to save edits for a woof - not currently used
  def update
    woof = Woof.find params[:id]
    woof.update woof_params
    redirect_to root_path
  end


  def show
    @woof = Woof.find params[:id]
  end


  # Delete a Woof
  def destroy
   @woof.destroy
   flash[:success] = "Woof deleted"
   redirect_to request.referrer || root_url
 end


  private
  def woof_params
    params.require(:woof).permit(:status, :user_id, :image)
  end

  # Ensure that only the current user is posting the woof from their account
  def correct_user
     @woof = current_user.woofs.find_by(id: params[:id])
     redirect_to root_url if @woof.nil?
   end
end
