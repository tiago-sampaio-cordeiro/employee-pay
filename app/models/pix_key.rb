class PixKey < ApplicationRecord
  belongs_to :employee

  validates :key, presence: true, uniqueness: true
end
