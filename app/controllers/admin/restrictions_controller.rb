class Admin::RestrictionsController < ApplicationController
  
  def day
    @default_limits = DefaultLimit.all
    @restrictions = Restriction.all
  end
  
  def time
    @day_params = params[:format]
  end
  
  def update
  end
  
  def update_all
  end
  
end
