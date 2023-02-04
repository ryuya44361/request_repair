class Engineer::EvaluationsController < ApplicationController
  before_action :authenticate_engineer!
  
  def show
    @evaluation = Evaluation.find_by(completion_id: params[:id])
  end
  
end
