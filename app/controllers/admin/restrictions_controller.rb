class Admin::RestrictionsController < ApplicationController

  def day
    @default_limits = DefaultLimit.all
  end

  def time
    @day_params = params[:format]
    @restrictions = Restriction.all
    @default_limits = DefaultLimit.all
    
    if Restriction.find_by(reservation_day: @day_params)
      @restrictions = Restriction.find_by(reservation_day: @day_params)
    else
      @default_limits.each do |default_limit|
        @restrictions.reservation_day = @day_params
        @restrictions.start_time = default_limit.start_time
        @restrictions.finish_time = default_limit.finish_time
        @restrictions.headcount = default_limit.headcount
      end
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
