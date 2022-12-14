class Engineer::EngineersController < ApplicationController
  
  def show
    @engineer = current_engineer
  end

  def edit
    @engineer = current_engineer
  end
  
  def update
    @engineer = current_engineer
    if @engineer.update(engineer_params)
      redirect_to engineers_path
    else
      render :edit
    end
  end
  
  private

  def engineer_params
    params.require(:engineer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:telephone_number,:engineers_deleted)
  end
end
