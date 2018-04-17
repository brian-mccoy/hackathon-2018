class Ticket < ApplicationRecord
  belongs_to :user
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :message, presence: true
end
