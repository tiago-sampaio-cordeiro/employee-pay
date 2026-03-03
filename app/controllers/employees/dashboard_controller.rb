module Employees
  class DashboardController < ApplicationController
    before_action :require_employee
    def index
    end
  end
end