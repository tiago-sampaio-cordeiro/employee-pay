module ApplicationHelper
  def format_hours(decimal_hours)
    hours = decimal_hours.to_i
    minutes = ((decimal_hours - hours) * 60).round
    format("%02d:%02d", hours, minutes)
  end
end
