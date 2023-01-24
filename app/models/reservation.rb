class Reservation < ApplicationRecord

  has_one :completion
  belongs_to :customer
  belongs_to :engineer
  belongs_to :genre
  belongs_to :restriction
  has_many_attached :repair_images




end
