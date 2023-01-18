class Public::ReservationsController < ApplicationController
  
  def day
    @default_limits = DefaultLimit.all
    @restrictions = Restriction.all
    
  end
  
  def time
  end
  
  def index
  end
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  def destroy
  end
  
  def cancel
  end
  
  def confirm
  end
  
  def complete
  end
  
  protected

    def reservations_parameters
      params.require(:reservation).permit(:customer_id,:engineer_id,:genre_id,:restriction_id,:reservation_at,:model_number,:serial_number,:introduction)
    end
  
end
