class Admin::RestrictionsController < ApplicationController
    before_action :authenticate_admin!
    
    def index
      @restrictions = Restriction.all
      @restriction = Restriction.new
    end
    
    def create
      @restriction = Restriction.new(restriction_params)
      
      if @restriction.save
        redirect_to admin_restrictions_path
      else
        @restrictions = Restriction.all
        render :index
      end
    end
    
    def destroy
    end
    
    private

  def restriction_params
    params.require(:restriction).permit(:reservation_day,:start_time,:finish_time,:headcount)
  end
end
