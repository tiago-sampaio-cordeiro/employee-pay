# frozen_string_literal: true

class Data::EmployeeDataComponent < ViewComponent::Base
  def initialize(first_name:, last_name:, role:, hourly_rate:, status:)
    @first_name = first_name
    @last_name = last_name
    @role = role
    @hourly_rate = hourly_rate
    @status = status
  end
end
