class Public::ReservationsController < ApplicationController
  
  def day
    @default_limits = DefaultLimit.all
    @restrictions = Restriction.all
    
  end
  
  def time
    @day_params = params[:format]
    @default_limits = DefaultLimit.all
    @restriction = Restriction.where(reservation_day: @day_params)
    if @restriction.blank?
      @restriction = @default_limits
    end
  end
  
  def new
    @reservation = Reservation.new
    @genres = Genre.all
  end
  
  def confirm
  end
  
  def complete
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
  def destroy
  end
  
  def cancel
  end
  
  protected

    def reservations_parameters
      params.require(:reservation).permit(:customer_id,:engineer_id,:genre_id,:completion_id,:image,:reservation_day,:start_time,:finish_time,:model_number,:serial_number,:introduction)
    end
  
end
