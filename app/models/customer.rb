class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reservations, dependent: :destroy
  
  def postal_code_display
    '〒' + postal_code
  end
  
  def address_display
  '〒' + postal_code + '　　' + address
  end
end
