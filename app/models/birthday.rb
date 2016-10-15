class Birthday < ApplicationRecord
  has_many :users
  validates :birthdate, presence: true
  validates :birthtime, presence: true
  validates :birthdate, uniqueness: { scope: :birthtime }
end
