class Public::ReservationsController < ApplicationController
  
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
  
  def day
  end
  
  def time
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
