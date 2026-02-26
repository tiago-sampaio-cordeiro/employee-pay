class Employee < ApplicationRecord
  belongs_to :user
  has_many :time_punches, dependent: :destroy
  has_many :phones, dependent: :destroy
  has_many :pix_keys, dependent: :destroy
  has_many :banks, dependent: :destroy

  enum :contract_type, { freelancer: 0, clt: 1 }

  validates :contract_type, presence: true
  validates :hourly_rate, presence: true, numericality: { greater_than: 0 }, if: :freelancer?
  validates :salary, presence: true, numericality: { greater_than: 0 }, if: :clt?
end
