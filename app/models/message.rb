class Message < ApplicationRecord
  belongs_to :user
  belongs_to :connection

  validates :user, presence: true
  validates :connection, presence: true
  validates :content, presence: true
end
