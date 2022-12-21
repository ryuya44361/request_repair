# frozen_string_literal: true

class Engineer::RegistrationsController < Devise::RegistrationsController
 before_action :engineer_permitted_parameters, if: :devise_controller?
 
  def after_sign_in_path_for(resource)
    engineer_path
  end
 
  protected

    def engineer_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:telephone_number])
    end
end
