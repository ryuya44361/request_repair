class Engineer::ReservationsController < ApplicationController
  before_action :authenticate_engineer!

  def day
    @reservations = Reservation.all
  end

  def index
    @day_params = params[:format]
    @reservation = Reservation.where(reservation_day: @day_params,complete_status: false,reservation_status: true).page(params[:page])

  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def confirm
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @engineer = current_engineer
    if @reservation.engineer_id.blank?
      @reservation.update(engineer_id: @engineer.id)
      
      redirect_to engineer_engineers_path
    else
      render engineer_reservation_path(reservation.id)
    end
  end

  private

  def reservations_params
    params.require(:reservation).permit(:customer_id,:engineer_id,:genre_id,:complete_status,:reservation_day,
                                        :start_time,:finish_time,:model_number,:serial_number,:introduction, repair_images: [])
  end

end
