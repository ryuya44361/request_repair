class Public::CompletionsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @completions = Completion.page(params[:page])
  end

  def show
    @completion = Completion.find(params[:id])
    @evaluation = Evaluation.where(completion_id: @completion.id)
  end
  
end
