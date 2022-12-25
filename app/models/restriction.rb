class Restriction < ApplicationRecord
  
  has_many :reservations, dependent: :destroy
end
