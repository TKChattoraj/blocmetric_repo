class AppsController < ApplicationController
  before_action :authenticate_user!
  #after_action :verify_authorized


  def index
    @user = User.find(params[:user_id])
    @apps = @user.apps

  end

  def show
    @user = User.find(params[:user_id])
    @app = App.find(params[:id])
  end


  def new

  end



  def create

  end



  def edit

  end



  def update

  end



  def destroy

  end


  private

  def app_params
    # Strong params for the bookmark
    params.require(:app).permit(:url, :user_id)
  end


end
