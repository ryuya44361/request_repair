class Genre < ApplicationRecord
  
  has_many :reservations, dependent: :destroy
end
