class Employee < ApplicationRecord
  belongs_to :user
  has_many :time_punches, dependent: :destroy

  enum :contract_type, { freelancer: 0, clt: 1 }


  validates :hourly_rate, presence: true, numericality: { greater_than: 0 }
end
