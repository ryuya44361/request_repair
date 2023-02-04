class Evaluation < ApplicationRecord
  
  belongs_to :completion, optional: true
  
  validates :completion_id, presence: true
  validates :evaluation, presence: true
  
end
