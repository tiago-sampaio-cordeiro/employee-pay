class ReportsController < ApplicationController
  def index
    range = build_range

    employees = Employee.includes(:user, :time_punches)

    @results = employees.map do |employee|
      amount = Payroll::Payment
                 .new(employee: employee, range: range)
                 .call

      {
        employee: employee,
        hours: Payroll::HoursCalculator
                 .new(employee: employee, range: range)
                 .call,
        amount: amount
      }
    end
  end

  private

  def build_range
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date]).beginning_of_day
      end_date   = Date.parse(params[:end_date]).end_of_day

      start_date..end_date
    else
      Date.current.beginning_of_month..Date.current.end_of_month
    end
  end
end
