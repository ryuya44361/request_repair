class Admin::RestrictionsController < ApplicationController

  def day
    @default_limits = DefaultLimit.all
    @headcount = DefaultLimit.last.headcount
    
  end

  def time
    @day_params = params[:format]
    @restrictions = Restriction.all

    if Restriction.find_by(reservation_day: @day_params)
      @restriction = Restriction.where(reservation_day: @day_params)
    else
      @restriction = DefaultLimit.all
    end
  end

  def update
    if restriction_params.nil? #デフォルトリミットのデータが入っていた場合
      restriction_params[:reservation_day] = default_limit.reservation_day
      restriction_params[:start_time] = default_limit.start_time
      restriction_params[:finish_time] = default_limit.finish_time
      restriction_params[:headcount] = default_limit.headcount
    end
    
    #01/10次回すべてのデータを入れるか？カラムを追加するか？を記載
    
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
    params.require(:default_limit).permit(:headcount)
  end

end
