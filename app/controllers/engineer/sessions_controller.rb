# frozen_string_literal: true

class Engineer::SessionsController < Devise::SessionsController
  before_action :engineer_state, only: [:create]

  def after_sign_in_path_for(resource)
    engineer_engineers_path
  end

  def after_sign_out_path_for(resource)
    new_engineer_session_path
  end

  protected

  def engineer_state
     @engineer = Engineer.find_by(email: params[:engineer][:email])
     return if !@engineer
      if @engineer.valid_password?(params[:engineer][:password])
        if @engineer.engineers_deleted && true
          redirect_to new_engineer_session_path
        end
      end
  end
end
