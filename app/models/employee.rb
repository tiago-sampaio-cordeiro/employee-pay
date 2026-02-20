class Employee < ApplicationRecord
  belongs_to :user
  has_many :time_punches, dependent: :destroy

  validates :hourly_rate, presence: true, numericality: { greater_than: 0 }
end
