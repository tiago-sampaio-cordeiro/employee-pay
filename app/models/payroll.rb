class Payroll < ApplicationRecord
  belongs_to :employee
  has_many :payroll_adjustments, dependent: :restrict_with_exception


  validates :reference_month, presence: true
end
