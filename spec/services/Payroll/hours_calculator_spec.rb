require 'rails_helper'

RSpec.describe Payroll::HoursCalculator, type: :service do
  let(:employee) { create(:employee) }

  describe "#.call" do
    it "punches calculated correctly with complete pairs" do
      clock_in = create(:time_punch, employee: employee, kind: :clock_in, punched_at: "2026-01-01 08:00:00.000")
      clock_out = create(:time_punch, employee: employee, kind: :clock_out, punched_at: "2026-01-01 09:00:00.000")

      punches = [clock_in, clock_out]

      result = Payroll::HoursCalculator.new(punches: punches).call

      expect(result).to eq(1.0)
    end

    it "clock_in ignored if not matching with other clock_out" do
      clock_in1 = create(:time_punch, employee: employee, kind: :clock_in, punched_at: "2026-01-01 08:00:00.000")
      clock_out = create(:time_punch, employee: employee, kind: :clock_out, punched_at: "2026-01-01 09:00:00.000")
      clock_in2 = create(:time_punch, employee: employee, kind: :clock_in, punched_at: "2026-01-01 10:00:00.000")
      punches = [clock_in1, clock_out, clock_in2]

      result = Payroll::HoursCalculator.new(punches: punches).call

      expect(result).to eq(1.0)
    end

    it "return 0 if not there are punches" do
      punches = []

      result = Payroll::HoursCalculator.new(punches: punches).call

      expect(result).to eq(0)
    end

    it "punches calculated correctly when punches there are in differents dates" do
      clock_in1 = create(:time_punch, employee: employee, kind: :clock_in, punched_at: "2026-01-01 23:30:00.000")
      clock_out = create(:time_punch, employee: employee, kind: :clock_out, punched_at: "2026-01-02 00:30:00.000")

      punches = [clock_in1, clock_out]

      result = Payroll::HoursCalculator.new(punches: punches).call

      expect(result).to eq(1.0)
    end
  end
end