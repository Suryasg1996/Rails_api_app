class Building < ApplicationRecord
  has_many :floors, dependent: :destroy
  has_many :rooms, through: :floors
  validates :name, presence: true, length: { minimum:3 }
  validates :number_of_floors, numericality: { only_integer: true }
end
