class Admin::EngineersController < ApplicationController
  
  def index
    @engineers = Engineer.page(params[:page])
  end
  
  def show
    @engineer = Engineer.find(params[:id])
  end
  
  def edit
    @engineer = Engineer.find(params[:id])
  end
  
  def update
    @engineer = Engineer.find(params[:id])
    if @engineer.update(engineer_params)
      redirect_to admin_engineer_path(@engineer.id)
    else
      render :edit
    end
    
  end
  
  def destroy
  end
  
  private
  
  def engineer_params
    params.require(:engineer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:telephone_number,:engineers_deleted)
  end
end
