class AppsController < ApplicationController

  def index

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
