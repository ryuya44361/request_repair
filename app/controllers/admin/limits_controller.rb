class Admin::LimitsController < ApplicationController
    before_action :authenticate_admin!
    
    def day
    end
    
    def update_all
    end
    
    def time
    end
    
    def destroy
    end
    
    def update
    end
    
    private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
