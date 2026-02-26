# frozen_string_literal: true

class Data::EmployeeDataComponent < ViewComponent::Base
  def initialize(first_name:, last_name:, email_address:, role:, hourly_rate:, status:)
    @first_name = first_name
    @last_name = last_name
    @email_address = email_address
    @role = role
    @hourly_rate = hourly_rate
    @status = status
  end
end
