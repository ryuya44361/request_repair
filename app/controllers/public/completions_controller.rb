class Public::CompletionsController < ApplicationController
  
  def index
    @completions = Completion.page(params[:page])
  end

  def show
    @completion = Completion.find(params[:id])
  end
  
end
