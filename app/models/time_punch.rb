class TimePunch < ApplicationRecord
  belongs_to :employee

  enum :kind, { clock_in: 0, clock_out: 1 }

  validates :punched_at, presence: true
  validates :kind, presence: true
  validate :valid_sequence
  private

  def valid_sequence
    last_punch = employee.time_punches
                         .where.not(id: id)
                         .order(:punched_at)
                         .last

    return unless last_punch

    if last_punch.kind == kind
      errors.add(:kind, "sequência inválida")
    end
  end
end
