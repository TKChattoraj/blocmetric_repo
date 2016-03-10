class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      #devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.for(:sign_up) << :username
    end

  private

    def user_not_authorized
      flash[:notice] = "You are not authorized to do that!"
      redirect_to(request.referrer || root_path)
    end


end
