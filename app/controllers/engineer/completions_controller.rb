class Engineer::CompletionsController < ApplicationController
  before_action :authenticate_engineer!

  def new
    @reservation = Reservation.find(params[:id])
    @completion = Completion.new
  end

  def confirm
    @completion = Completion.new(completions_params)
    @reservation = Reservation.find(params[:completion][:reservation_id])
    @substance_params = params[:completion][:substance]
  end

  def create
    @completion = Completion.new(completions_params)
    if @completion.save
      @reservation = Reservation.find(params[:completion][:reservation_id])
      @reservation.update(complete_status: true)
      redirect_to engineer_engineers_path
    else
      @reservation = Reservation.find(@completion.reservation_id)
      render :new
    end

  end

  def index
    @completions = Completion.page(params[:page])
  end

  def show
    @completion = Completion.find(params[:id])
    @evaluation = Evaluation.where(completion_id: @completion.id)
  end


  private

  def completions_params
    params.require(:completion).permit(:reservation_id, :substance)
  end

end
