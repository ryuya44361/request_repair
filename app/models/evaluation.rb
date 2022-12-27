class Evaluation < ApplicationRecord
  
  belongs_to :completion, optional: true
end
