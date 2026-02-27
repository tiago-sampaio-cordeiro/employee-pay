class RegistersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    employee = Register::EmployeeRecords.new(
      first_name: employee_params[:first_name],
      last_name: employee_params[:last_name],
      email_address: employee_params[:email_address],
      active: employee_params[:active],
      role: employee_params[:role],
      password: employee_params[:password],
      password_confirmation: employee_params[:password_confirmation],
      hourly_rate: employee_params[:hourly_rate],
      birth_date: employee_params[:birth_date],
      gender: employee_params[:gender],
      admission_date: employee_params[:admission_date],
      address: employee_params[:address],
      contract_type: employee_params[:contract_type],
      salary: employee_params[:salary],
      pis: employee_params[:pis],
      ctps: employee_params[:ctps],
      position: employee_params[:position],
      cnpj: employee_params[:cnpj],
      phone_numbers: employee_params[:phones] || [],
      pix_keys: employee_params[:pix_keys] || [],
      banks: employee_params[:banks] || [],
      user_id: nil
    )

    if employee.call
      redirect_to registers_path, notice: "Funcionário cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    employee = Register::EmployeeRecords.new(
      first_name: employee_params[:first_name],
      last_name: employee_params[:last_name],
      email_address: employee_params[:email_address],
      active: employee_params[:active],
      role: employee_params[:role],
      password: employee_params[:password],
      password_confirmation: employee_params[:password_confirmation],
      hourly_rate: employee_params[:hourly_rate],
      birth_date: employee_params[:birth_date],
      gender: employee_params[:gender],
      admission_date: employee_params[:admission_date],
      address: employee_params[:address],
      contract_type: employee_params[:contract_type],
      salary: employee_params[:salary],
      pis: employee_params[:pis],
      ctps: employee_params[:ctps],
      position: employee_params[:position],
      cnpj: employee_params[:cnpj],
      phone_numbers: employee_params[:phones] || [],
      pix_keys: employee_params[:pix_keys] || [],
      banks: employee_params[:banks] || [],
      user_id: params[:id]
    )

    if employee.update
      redirect_to registers_path, notice: "Funcionário atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def edit
    @user = User.find(params[:id])
  end

  private
  def employee_params
    params.permit(
      :first_name, :last_name, :email_address, :active, :role, :password, :password_confirmation, :hourly_rate,
      :user_id, :birth_date, :gender, :admission_date, :contract_type, :address, :salary, :pis, :ctps, :position, :cnpj,
      phones: [],
      pix_keys: [],
      banks: [:name, :agency, :account]
    )
  end
end
