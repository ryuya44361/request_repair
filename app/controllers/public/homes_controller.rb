class Public::HomesController < ApplicationController
  
  def top
    @default_limits = DefaultLimit.all
    @restrictions = Restriction.all
  end
  
  def about
  end
  
end
