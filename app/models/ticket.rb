class Ticket < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :projects, optional: true
  validates :title, presence: true
end
