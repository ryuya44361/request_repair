class Engineer::EvaluationsController < ApplicationController
  
  def show
    @evaluation = Evaluation.find_by(completion_id: params[:id])
  end
  
end
