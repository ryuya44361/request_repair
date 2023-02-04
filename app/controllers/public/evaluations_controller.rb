class Public::EvaluationsController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @completion_params = params[:completion_id]
    @evaluation = Evaluation.new
  end
  
  def show
    @evaluation = Evaluation.find_by(completion_id: params[:id])
  end
  
  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to completion_path(@evaluation.completion_id)
    else
      render :new
    end
  end
  
  private

  def evaluation_params
    params.require(:evaluation).permit(:completion_id,:evaluation,:comment)
  end
  
end
