class ReportsController < ApplicationController
  def index
    range = build_range
    @results = build_reports(range)
  end

  private

  def build_reports(range)
    # return [] unless Current.user ## caso gere erro na linha 58 de views/reports/index.html.erb
    if Current.user.admin?
      build_report_admin(range)
    else
      build_report_employee(range)
    end
  end

  def build_report_admin(range)
    Employee.includes(:time_punches).map do |employee|
      build_result(employee, range)
    end
  end

  def build_report_employee(range)
    employee = Current.user.employee
    [ build_result(employee, range) ]
  end

  def build_result(employee, range)
    {
      employee: employee,
      hours: Payroll::HoursCalculator.new(employee: employee, range: range).call,
      amount: Payroll::Payment.new(employee: employee, range: range).call
    }
  end

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
