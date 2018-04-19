class Project < ApplicationRecord
  validates :title, presence: true
  has_many :tickets
  belongs_to :teams, optional: true
end
