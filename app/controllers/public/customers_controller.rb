class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
    @reservation = Reservation.find_by(customer_id: @customer.id,complete_status: false,reservation_status: true)
    @completes = Reservation.where(customer_id: current_customer.id,complete_status: true)
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end
  
  def secession
    @customer = current_customer
  end
  
  def change
    @customer = current_customer
    @customer.update(is_deleted: "true")
    sign_out @customer
    redirect_to root_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number,:is_deleted)
  end
  
end
