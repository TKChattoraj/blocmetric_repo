class AppsController < ApplicationController
  before_action :authenticate_user!
  #after_action :verify_authorized

  after_action :verify_authorized, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?


  def index

    authorize App
    #@user = User.find(params[:user_id])
    @user = current_user
    @apps = policy_scope(App)
  end

  def show
    @app = App.find(params[:id])
    authorize @app
    @user = User.find(params[:user_id])
    @events_hash_grouped_by_name = @app.events.group_by{|e| e.name}

  end


  def new
    @user = User.find(params[:user_id])
    @app = App.new
    authorize @app
  end



  def create
    @user = User.find(params[:user_id])
    @app = @user.apps.new(app_params)
    @app.user = @user
    authorize @app

    if @app.save
      flash[:notice] = "New App Created!"
      redirect_to user_app_path(@user, @app)
    else
      flash[:error] = "App could not be created!"
      redirect_to new_user_app_path
    end
  end

  def edit
    @app = App.find(params[:id])
    authorize @app
  end


  def update
    @user = User.find(params[:user_id])
    @app = @user.apps.find(params[:id])
    authorize @app

    if @app.update_attributes(app_params)
      flash[:notice] = "App Updated!"
      redirect_to user_app_path(@user, @app)
    else
      flash[:error] = "Error!  App NOT Updated!"
      render_template edit_user_app_path(@user, @app)
    end
  end


  def destroy
    @user = User.find(params[:user_id])
    @app = @user.apps.find(params[:id])
    authorize @app

    if @app.destroy
      flash[:notice] = "App Deleted!"
      redirect_to user_apps_path(@user)
    else
      flash[:error] = "Error!  App NOT Deleted!"
      render_template user_app_path(@user, @app)
    end

  end


  private

  def app_params
    # Strong params for the bookmark
    params.require(:app).permit(:url, :user_id, :name)
  end


end
