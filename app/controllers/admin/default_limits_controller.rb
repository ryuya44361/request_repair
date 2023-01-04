class Admin::DefaultLimitsController < ApplicationController
    before_action :authenticate_admin!
    
    def index
      @default_limits = DefaultLimit.all
      @default_limit = DefaultLimit.new
    end
    
    def create
      @default_limit = DefaultLimit.new(default_limit_params)
      
      if @default_limit.save
        redirect_to admin_default_limits_path
      else
        @default_limits = DefaultLimit.all
        render :index
      end
    end
    
    def destroy
      default_limit = DefaultLimit.find(params[:id])
      default_limit.destroy
      redirect_to admin_default_limits_path
    end
    
    private

  def default_limit_params
    params.require(:default_limit).permit(:start_time,:finish_time,:headcount)
  end
end
