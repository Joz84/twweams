class Connection < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :messages

  validates :sender, presence: true
  validates :receiver, presence: true
  validates :sender, uniqueness: { scope: :receiver }
end
