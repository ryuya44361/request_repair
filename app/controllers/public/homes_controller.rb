class Public::HomesController < ApplicationController
  
  def top
    @restrictions = Restriction.all
    @default_limits = DefaultLimit.all
  end
  
  def about
  end
  
end
