class User < ApplicationRecord
  has_many :tickets, :dependent => :destroy
  has_and_belongs_to_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def display_name
    self[:display_name].presence || email
  end

end
