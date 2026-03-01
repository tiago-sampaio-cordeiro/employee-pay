module Payroll
  class Payment
    def initialize(employee:, range:)
      @employee = employee
      @range = range
    end

    def call
      calculate_payment
    end

    def calculate_payment
      worked_hours = HoursCalculator.new(employee: employee, range: range).call
      hours_difference = (176 - worked_hours).abs
      fixed_salary = employee[:salary]
      if employee.clt?
        if worked_hours < 176
          fixed_salary - (hours_difference * 7.5)
        elsif worked_hours > 176
          fixed_salary + (hours_difference * 15)
        else
          fixed_salary
        end
      else
        return 0 unless employee.hourly_rate
        worked_hours * employee.hourly_rate
      end
    end

    private
    attr_reader :employee, :range
  end
end
