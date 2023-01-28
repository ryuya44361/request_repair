class Engineer::CorrespondencesController < ApplicationController

  def index
    @reservations = Reservation.where(engineer_id: current_engineer.id,complete_status: false,reservation_status: true).page(params[:page])
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

end
