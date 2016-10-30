class User < ApplicationRecord
  has_many :posts

  has_attachment :photo

  has_many :connections
  has_many :messages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birthday, presence: true
  geocoded_by :user_city
  after_validation :geocode, if: :user_city_changed?

  def full_name
    "#{first_name} #{last_name}"
  end

  def user_city
    "#{city} #{ISO3166::Country[country].name}"
  end

  def user_city_changed?
    city_changed? || country_changed?
    # address_changed? || zip_code_changed? ||
  end

  def self.birthdate(params)
    year = datetime_params["birthdate(1i)"].to_i
    month = datetime_params["birthdate(2i)"].to_i
    day = datetime_params["birthdate(3i)"].to_i
    DateTime.new(year, month, day, 0, 0, 0, "+00:00")
  end
end
