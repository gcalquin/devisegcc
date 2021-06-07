class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permited_parameters, if: :devise_controller?

  protected
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end

  def authnticate_admin!
    unless current_user.present? && current_user.is_admin?
      redirect_to root_path, :notice => "No tienes permiso..."
    end
  end
  

end
