class Restriction < ApplicationRecord
  
  has_many :reservations, dependent: :destroy
  belongs_to :default_limit
end
