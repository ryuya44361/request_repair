class Engineer::CorrespondencesController < ApplicationController
  before_action :authenticate_engineer!

  def index
    @reservation_my = Reservation.where(engineer_id: current_engineer.id,complete_status: false,reservation_status: true)
  
  #　絞り込み処理 
    if params[:today]
      @reservations = @reservation_my.today.page(params[:page])
    elsif params[:tomorrow]
      @reservations =@reservation_my.tomorrow.page(params[:page])
    elsif params[:after]
      @reservations = @reservation_my.after.page(params[:page])
    else
      @reservations = @reservation_my.page(params[:page])
    end
  # ここまで
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

end
