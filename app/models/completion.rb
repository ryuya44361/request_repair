class Completion < ApplicationRecord
  
  has_one :evaluation
  belongs_to :reservation
  
end
