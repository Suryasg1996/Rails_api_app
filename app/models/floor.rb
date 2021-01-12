class Floor < ApplicationRecord
  belongs_to :building
  has_many :rooms, dependent: :destroy
  validates :number_of_doors, numericality: { only_integer: true }
  validates :number_of_rooms, numericality: { only_integer: true }
  validates :number_of_windows, numericality: { only_integer: true }

  validate :validate_number_of_floors

  private
  def validate_number_of_floors
    if self.building.floors.count > self.building.number_of_floors
      errors.add(:number_of_floors, "Maximum limit of floors has been reached for this Building.")
    end
  end
end
