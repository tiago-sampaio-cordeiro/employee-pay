class PayrollAdjustment < ApplicationRecord
  belongs_to :payroll

  enum :kind, { extra: 0, discount: 1 }

  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
