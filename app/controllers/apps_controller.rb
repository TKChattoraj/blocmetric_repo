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
    @user = User.find(params[:user_id])
    @app = App.new
  end



  def create
    @user = User.find(params[:user_id])
    @app = @user.apps.new(app_params)
    @app.user = @user
    puts @app.url
    puts @app.user

    if @app.save
      puts "saved"
      flash[:notice] = "New App Created!"
      redirect_to user_app_path(@user, @app)
    else
      puts "not saved"
      flash[:error] = "App could not be created!"
      redirect_to new_user_app_path
    end
  end




  def edit
    @app = App.find(params[:id])
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
