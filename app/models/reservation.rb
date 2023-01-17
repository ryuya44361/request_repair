class Reservation < ApplicationRecord
  
  has_one :completion
  belongs_to :customer
  belongs_to :engineer, optional: true
  belongs_to :genre
  belongs_to :restriction
  
  def decreased_capacity
    .remaining_seat - number_of_people
  end
end
