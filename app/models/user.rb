class User < ApplicationRecord
  belongs_to :birthday
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birthday, presence: true
  # validates :birthtime, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
