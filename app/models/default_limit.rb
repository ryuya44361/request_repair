class DefaultLimit < ApplicationRecord
  
  has_many :restrictions, dependent: :destroy
  
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :headcount, presence: true
  
end
