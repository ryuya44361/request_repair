class Engineer::CompletionsController < ApplicationController
  
  def completion
    @reservation = Reservation.find(params[:id])
    @completion = Completion.new
  end
  
  def update
    @completion = Completion.new(completions_params)
    if @completion.save
      @reservation = Reservation.find(params[:id])
      @reservation.update(complete_status: true)
      redirect_to engineer_engineers_path
    else
      @reservation = Reservation.find(params[:id])
      @completion = Completion.new
      render completion_
    end
    
  end
  
  def index
  end
  
  def show
  end
  
  
  private
  
  def completions_params
    params.require(:completion).permit(:reservation_id, :substance)
  end
  
end
