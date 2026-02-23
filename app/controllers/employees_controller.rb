class EmployeesController < ApplicationController
  helper_method :next_punch_kind
  def index
  end

  def create
    time_clock = TimeClock::EmployeeTimeClock.new(
      employee: Current.user.employee,
      kind: time_clocks_params[:kind],
      punched_at: DateTime.current).call
    if time_clock
      redirect_to employees_path, notice: "Ponto registrado com sucesso!"
    else
      render :index, status: :unprocessable_entity
    end
  end

  def next_punch_kind
    last = Current.user.employee.time_punches.order(:punched_at).last
    last&.clock_in? ? "clock_out" : "clock_in"
  end

  private

  def time_clocks_params
    params.permit(:kind)
  end
end
