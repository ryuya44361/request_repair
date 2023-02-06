class Reservation < ApplicationRecord

  has_one :completion
  belongs_to :customer
  belongs_to :engineer, optional: true
  belongs_to :genre
  has_many_attached :repair_images

  def get_repair_images(width, height)
    unless repair_images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      repair_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    repair_images.variant(resize_to_limit: [width, height]).processed
  end


  validates :customer_id, presence: true
  validates :genre_id, presence: true
  validates :reservation_day, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :model_number, presence: true
  validates :serial_number, presence: true
  validates :introduction, presence: true
  validates :repair_images, presence: true



end
