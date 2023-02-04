class Completion < ApplicationRecord

  has_one :evaluation
  belongs_to :reservation, optional: true
  
  validates :reservation_id, presence: true
  validates :substance, presence: true

end
