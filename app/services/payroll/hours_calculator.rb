module Payroll
  class HoursCalculator
    def initialize(employee:, range:)
      @employee = employee
      @range = range
    end

    def call
      calculate_hours
    end

    def calculate_hours
      punches = fetch_punches.to_a
      clock_ins = punches.select do |punch|
        punch.clock_in?
      end
      clock_outs = punches.select do |punch|
        punch.clock_out?
      end

      total_seconds = clock_ins.zip(clock_outs).sum do |clock_in, clock_out|
        next 0 if clock_out.nil?
        clock_out.punched_at.to_time - clock_in.punched_at.to_time
      end
      total_seconds / 3600.0
    end

    private

    attr_reader :employee, :range

    def fetch_punches
      employee.time_punches
              .where(punched_at: range)
              .order(:punched_at)
    end
  end
end
