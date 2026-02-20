module Payroll
  class Payment
    def initialize(employee:, range:)
      @employee = employee
      @range = range
    end

    def call

      calculator = HoursCalculator.new(employee: employee, range: range).call
      (calculator * employee.hourly_rate).to_f
    end

    private
    attr_reader :employee, :range
  end
end

# employee = Employee.first
# range = Date.today.beginning_of_month..Date.today
# teste = Payroll::Payment.new(employee: employee, range: range)
# teste.call