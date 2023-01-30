class Admin::HomesController < ApplicationController
  
  def top
     @reservations = Reservation.all
  end
  
end
