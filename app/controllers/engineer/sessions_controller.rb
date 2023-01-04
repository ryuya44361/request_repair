# frozen_string_literal: true

class Engineer::SessionsController < Devise::SessionsController
  
  def after_sign_in_path_for(resource)
    engineers_path
  end

  def after_sign_out_path_for(resource)
    new_engineer_session_path
  end
end
