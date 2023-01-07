class Admin::RestrictionsController < ApplicationController

  def day
    @default_limits = DefaultLimit.all
    @restrictions = Restriction.all
  end

  def time
    @day_params = params[:format]
    
    if Restriction.where(reservation_day: @day_params)
      @
    else
    end
  end

  def update
    @restriction = 
      Restriction.find_or_initilzed_by(
        reservation_day: restriction_params[:reservation_day],
        start_time: restriction_params[:start_time], 
        finish_time: restriction_params[:finish_time],
      )
      
      
     if @restriction.update(headcount: restriction_params[:headcount])  
     else
     end
  end

  def update_all
    @default_limits = DefaultLimit.all
    if @default_limits.update_all(headcount: default_limit_params[:headcount])
      redirect_to day_admin_restrictions_path
    else
      render day_admin_restrictions_path
    end
  end

private

  def restriction_params
    params.require(:restriction).permit(:reservation_day, :start_time, :finish_time, :headcount)
  end

  def default_limit_params
    params.require(:default_limit).permit(:start_time,:finish_time,:headcount)
  end

end
