class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :projects
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :description, presence: true
end
