class Admin::EvaluationsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @evaluation = Evaluation.find_by(completion_id: params[:id])
  end
  
  def edit
    @evaluation = Evaluation.find_by(completion_id: params[:id])
  end
  
  def update
     @evaluation = Evaluation.find(params[:id])
    if @evaluation.update(evaluation_params)
      redirect_to admin_completion_path(@evaluation.completion_id)
    else
      render :edit
    end
  end
  
  private

  def evaluation_params
    params.require(:evaluation).permit(:completion_id,:evaluation,:comment)
  end
  
end
