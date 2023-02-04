class Restriction < ApplicationRecord
  
  has_many :reservations, dependent: :destroy
  belongs_to :default_limit
  
  validates :default_limit_id, presence: true
  validates :reservation_day, presence: true
  validates :headcount, presence: true
  validates :update_status, presence: true
  
end
