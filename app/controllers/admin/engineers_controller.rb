class Admin::EngineersController < ApplicationController
  
  def index
    @engineers = Engineer.page(params[:page])
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def engineer_params
    params.require(:engineer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:telephone_number,:engineers_deleted)
  end
end
