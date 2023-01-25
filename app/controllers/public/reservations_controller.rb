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
        @default_limits.each do |default_limit|
          Restriction.create(reservation_day: @day_params, default_limit_id: default_limit.id)
        end
        @restriction = Restriction.where(reservation_day: @day_params)
      end
  end

  def new
    @reservation = Reservation.new
    @day_params = params[:reservation_day]
    @start_time_params = params[:start_time]
    @finish_time_params = params[:finish_time]
    @genres = Genre.all
  end

  def confirm
    
    @reservation = Reservation.where(customer_id: current_customer.id,complete_status: false,reservation_status: false)
    # @reservation.get_repair_image(100,100)

  end

  def complete
    @restriction = Restriction.find(params[:id])
    @restriction.update(reservation_status: "true")
    
  end

  def create
    # byebug
    @reservation = Reservation.new(reservations_params)
    if @reservation.save
      redirect_to confirm_reservations_path
    else
      @default_limits = DefaultLimit.all
      @restrictions = Restriction.all
      render :day
    end
  end

  def show
    @reservation = Reservation.where(customer_id: current_customer.id,complete_status: false)
  end

  def destroy
    restriction = Restriction.find(params[:id])
    restriction.destroy
    redirect_to customers_path
  end

  private

  def reservations_params
    params.require(:reservation).permit(:customer_id,:genre_id,:complete_status,:reservation_day, 
                                        :start_time,:finish_time,:model_number,:serial_number,:introduction, repair_images: [])
  end

end
