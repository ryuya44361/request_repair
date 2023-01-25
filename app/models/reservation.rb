class Reservation < ApplicationRecord
  
  has_one :completion
  belongs_to :customer
  belongs_to :engineer, optional: true
  belongs_to :genre
  has_many_attached :repair_images
  
  

  
end
