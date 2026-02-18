class Employee < ApplicationRecord
  belongs_to :user
  has_many :time_punches, dependent: :restrict_with_exception
  has_many :payrolls, dependent: :restrict_with_exception
  enum :employment_type, { fixed: 0, hourly: 1 }
end
