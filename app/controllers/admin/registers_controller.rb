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
      phone_number: employee_params[:phone_number],
      pix_key: employee_params[:pix_key],
      rg: employee_params[:rg],
      cpf: employee_params[:cpf],
      mother_name: employee_params[:mother_name],
      mother_last_name: employee_params[:mother_last_name],
      emergency_phone_number: employee_params[:emergency_phone_number],
      nationality: employee_params[:nationality],
      city_born: employee_params[:city_born],
      uf_born: employee_params[:uf_born],
      blood_group: employee_params[:blood_group],
      allergies: employee_params[:allergies],
      driver_license: employee_params[:driver_license],
      driver_license_category: employee_params[:driver_license_category],
      driver_license_number: employee_params[:driver_license_number],
      cep: employee_params[:cep],
      house_number: employee_params[:house_number],
      neighborhood: employee_params[:neighborhood],
      city: employee_params[:city],
      uf_live: employee_params[:uf_live],
      reference: employee_params[:reference],
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
      phone_number: employee_params[:phone_number],
      pix_key: employee_params[:pix_key],
      rg: employee_params[:rg],
      cpf: employee_params[:cpf],
      mother_name: employee_params[:mother_name],
      mother_last_name: employee_params[:mother_last_name],
      emergency_phone_number: employee_params[:emergency_phone_number],
      nationality: employee_params[:nationality],
      city_born: employee_params[:city_born],
      uf_born: employee_params[:uf_born],
      blood_group: employee_params[:blood_group],
      allergies: employee_params[:allergies],
      driver_license: employee_params[:driver_license],
      driver_license_category: employee_params[:driver_license_category],
      driver_license_number: employee_params[:driver_license_number],
      cep: employee_params[:cep],
      house_number: employee_params[:house_number],
      neighborhood: employee_params[:neighborhood],
      city: employee_params[:city],
      uf_live: employee_params[:uf_live],
      reference: employee_params[:reference],
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
      :first_name, :last_name, :email_address, :active, :role, :password, :password_confirmation,
      :hourly_rate, :user_id, :birth_date, :gender, :admission_date, :contract_type, :address, :salary,
      :pis, :ctps, :position, :cnpj, :phone_number, :pix_key, :rg, :cpf, :mother_name, :mother_last_name,
      :emergency_phone_number, :nationality, :city_born, :uf_born, :blood_group, :allergies,
      :driver_license, :driver_license_category, :driver_license_number, :cep, :house_number,
      :neighborhood, :city, :uf_live, :reference
    )
  end
end
