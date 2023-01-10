class DefaultLimit < ApplicationRecord
  
  has_many :restrictions, dependent: :destroy
end
