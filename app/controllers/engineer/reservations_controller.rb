class Engineer::ReservationsController < ApplicationController
  
  def day
    @reservation = Reservation.all
  end
  
  def index
  end
  
  def show
  end
  
  def confirm
  end
  
  def update
  end
  
  private

  def reservations_params
    params.require(:reservation).permit(:customer_id,:genre_id,:complete_status,:reservation_day,
                                        :start_time,:finish_time,:model_number,:serial_number,:introduction, repair_images: [])
  end
  
end
