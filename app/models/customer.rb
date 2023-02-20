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

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true,numericality: { only_integer: true }, length: { is: 7 }
  validates :address, presence: true
  validates :telephone_number,numericality: { only_integer: true }
  validates :email, presence: true


end
