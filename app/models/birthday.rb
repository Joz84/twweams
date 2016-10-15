class Birthday < ApplicationRecord
  validates :birthdate, presence: true
  validates :birthtime, presence: true
  validates :birthdate, uniqueness: { scope: :birthtime }
end
