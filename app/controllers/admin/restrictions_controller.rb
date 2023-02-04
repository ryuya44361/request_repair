class Admin::RestrictionsController < ApplicationController
  before_action :authenticate_admin!

  def day
    @default_limits = DefaultLimit.all
    @headcount = DefaultLimit.last.headcount

  end

  def time
    @day_params = params[:format]
    @default_limits = DefaultLimit.all
    @restriction = Restriction.where(reservation_day: @day_params)
    if @restriction.blank?
      @default_limits.each do |default_limit|
        Restriction.create(reservation_day: @day_params, default_limit_id: default_limit.id)
      end
      @restriction = Restriction.where(reservation_day: @day_params)
    end
    # if Restriction.find_by(reservation_day: @day_params)
      # @restriction = Restriction.where(reservation_day: @day_params)
    # else
      # @restriction = @default_limits
    # end



  end

  def update
    @day_params = params[:restriction][:reservation_day]
    @restriction = Restriction.find(params[:id])
      if @restriction.update(headcount: restriction_params[:headcount], update_status: (@restriction.update_status + 1))
        
        redirect_to time_admin_restrictions_path(format: @day_params)
      else
        render time_admin_restrictions_path(format: @day_params)
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
    params.require(:restriction).permit(:default_limit_id, :reservation_day, :headcount)
  end

  def default_limit_params
    params.require(:default_limit).permit(:headcount)
  end

end
