class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource
 
  protected
 
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]

      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    
    def layout_by_resource
      if devise_controller?
        if resource_name == :admin
          "devise_admin_application"
        elsif resource_name == :user
          "devise_user_application"
        else
          "devise_application"
        end
        "application"
      end
    end
  
end
