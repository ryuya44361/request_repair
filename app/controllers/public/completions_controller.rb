class Public::CompletionsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @reservations = Reservation.where(customer_id: current_customer.id, complete_status: true).page(params[:page])
  end

  def show
    @completion = Completion.find(params[:id])
    @evaluation = Evaluation.where(completion_id: @completion.id)
  end

end
