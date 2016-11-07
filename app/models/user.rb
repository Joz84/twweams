class User < ApplicationRecord
  has_many :posts

  has_attachment :photo

  has_many :connections
  has_many :messages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum gender: [ :male, :female ]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true

  geocoded_by :user_city
  after_validation :geocode, if: :user_city_changed?

  def full_name
    a = first_name.capitalize
    b = last_name[0].upcase
    "#{a} #{b}."
  end

  def selected_users(birthday, male, female, length)
    if (male + female)%2 == 0
      users = User.where(birthday: birthday).near(self.location, length*200)
    elsif male == 1
      users = User.where(birthday: birthday).male.near(self.location, length*200)
    elsif female == 1
      users = User.where(birthday: birthday).female.near(self.location, length*200)
    end
    users
  end

  def location
    "#{city}, #{country}"
  end

  def user_city
    "#{city} #{ISO3166::Country[country].name}"
  end

  def user_city_changed?
    city_changed? || country_changed?
    # address_changed? || zip_code_changed? ||
  end

  def self.birthdate(params)
    year = params["birthdate(1i)"].to_i
    month = params["birthdate(2i)"].to_i
    day = params["birthdate(3i)"].to_i
    DateTime.new(year, month, day, 0, 0, 0, "+00:00")
  end
end
