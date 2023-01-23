class Reservation < ApplicationRecord
  
  has_one :completion
  belongs_to :customer
  belongs_to :engineer, optional: true
  belongs_to :genre
  belongs_to :restriction
  has_one_attached :repair_image
  
  
def get_repair_image(width, height)
  unless repair_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    repair_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    repair_image.variant(resize_to_limit: [width, height]).processed
end
  
end
