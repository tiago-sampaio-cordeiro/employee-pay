module Reports
  class EmployeeDailyReport
    def initialize(employee:, range:)
      @employee = employee
      @range    = range
    end

    def call
      punches = Reports::EmployeeTimePunchesQuery.new(employee: @employee, range: @range).call
      pairs = build_pairs(punches)

      pairs
        .group_by { |pair| pair[:clock_in].punched_at.to_date }
        .map do |date, day_pairs|
        {
          date: date,
          entries: day_pairs.map { |p| p[:clock_in].punched_at.strftime("%H:%M:%S") },
          exits: day_pairs.map { |p| p[:clock_out]&.punched_at&.strftime("%H:%M:%S") }.compact,
          total_hours: format_duration(total_hours(day_pairs))
        }
      end
        .sort_by { |h| h[:date] }
    end

    private

    def build_pairs(punches)
      clock_ins  = punches.select(&:clock_in?)
      clock_outs = punches.select(&:clock_out?)
      clock_ins.zip(clock_outs).map { |ci, co| { clock_in: ci, clock_out: co } }
    end

    def total_hours(pairs)
      worked_seconds = pairs.sum do |pair|
        next 0 unless pair[:clock_in] && pair[:clock_out]
        pair[:clock_out].punched_at - pair[:clock_in].punched_at
      end

      (worked_seconds / 3600.0)
    end

    def format_duration(hours)
      total_seconds = (hours * 3600).to_i
      hh = total_seconds / 3600
      mm = (total_seconds % 3600) / 60
      ss = total_seconds % 60
      format("%02d:%02d:%02d", hh, mm, ss)
    end
  end
end