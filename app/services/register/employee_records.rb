module Register
  class EmployeeRecords
    def initialize(first_name:, last_name:, email_address:, active:, role:, password:,
                   password_confirmation:, hourly_rate:, birth_date:, gender:, admission_date:,
                   address:, contract_type:, salary:, pis:, ctps:, position:, cnpj:, phone_number:,
                   pix_key:, rg:, cpf:, mother_name:, mother_last_name:, emergency_phone_number:,
                   nationality:, city_born:, uf_born:, blood_group:, allergies:, driver_license:,
                   driver_license_category:, driver_license_number:, cep:, house_number:,
                   neighborhood:,
                   city:, uf_live:, reference:, user_id:)

      @first_name = first_name
      @last_name = last_name
      @email_address = email_address
      @active = active
      @role = role
      @password = password
      @password_confirmation = password_confirmation
      @birth_date = birth_date
      @hourly_rate = hourly_rate
      @gender = gender
      @admission_date = admission_date
      @address = address
      @contract_type = contract_type
      @salary = salary
      @pis = pis
      @ctps = ctps
      @position = position
      @cnpj = cnpj
      @phone_number = phone_number
      @pix_key = pix_key
      @rg = rg
      @cpf = cpf
      @mother_name = mother_name
      @mother_last_name = mother_last_name
      @emergency_phone_number = emergency_phone_number
      @nationality = nationality
      @city_born = city_born
      @uf_born = uf_born
      @blood_group = blood_group
      @allergies = allergies
      @driver_license = driver_license
      @driver_license_category = driver_license_category
      @driver_license_number = driver_license_number
      @cep = cep
      @house_number = house_number
      @neighborhood = neighborhood
      @city = city
      @uf_live = uf_live
      @reference = reference
      @user_id = user_id
    end

    def call
      create_new_employee
    end

    def update
      update_employee
    end

    private

    attr_reader :first_name, :last_name, :email_address, :active, :role, :password,
                :password_confirmation, :hourly_rate, :contract_type, :salary, :pis, :ctps,
                :position, :cnpj, :gender, :birth_date, :admission_date, :address, :phone_number,
                :pix_key, :rg, :cpf, :mother_name, :mother_last_name, :emergency_phone_number,
                :nationality, :city_born, :uf_born, :blood_group, :allergies, :driver_license,
                :driver_license_category, :driver_license_number, :cep, :house_number,
                :neighborhood, :city, :uf_live, :reference, :user_id

    def create_new_employee
      user = User.create!(
        first_name: first_name,
        last_name: last_name,
        email_address: email_address,
        active: active,
        role: role,
        password: password,
        password_confirmation: password_confirmation
      )
      employee = Employee.create!(
        hourly_rate: hourly_rate,
        birth_date: birth_date,
        gender: gender,
        admission_date: admission_date,
        address: address,
        contract_type: contract_type,
        salary: salary,
        pis: pis,
        ctps: ctps,
        position: position,
        cnpj: cnpj,
        phone_number: phone_number,
        pix_key: pix_key,
        rg: rg,
        cpf: cpf,
        mother_name: mother_name,
        mother_last_name: mother_last_name,
        emergency_phone_number: emergency_phone_number,
        nationality: nationality,
        city_born: city_born,
        uf_born: uf_born,
        blood_group: blood_group,
        allergies: allergies,
        driver_license: driver_license,
        driver_license_category: driver_license_category,
        driver_license_number: driver_license_number,
        cep: cep,
        house_number: house_number,
        neighborhood: neighborhood,
        city: city,
        uf_live: uf_live,
        reference: reference,
        user: user
      )
    end

    def update_employee
      user = User.find(user_id)
      user.update!(
        first_name: first_name,
        last_name: last_name,
        email_address: email_address,
        active: active,
        role: role
      )

      employee = user.employee
      employee.update!(
        hourly_rate: hourly_rate,
        birth_date: birth_date,
        gender: gender,
        admission_date: admission_date,
        address: address,
        contract_type: contract_type,
        salary: salary,
        pis: pis,
        ctps: ctps,
        position: position,
        cnpj: cnpj,
        phone_number: phone_number,
        pix_key: pix_key,
        rg: rg,
        cpf: cpf,
        mother_name: mother_name,
        mother_last_name: mother_last_name,
        emergency_phone_number: emergency_phone_number,
        nationality: nationality,
        city_born: city_born,
        uf_born: uf_born,
        blood_group: blood_group,
        allergies: allergies,
        driver_license: driver_license,
        driver_license_category: driver_license_category,
        driver_license_number: driver_license_number,
        cep: cep,
        house_number: house_number,
        neighborhood: neighborhood,
        city: city,
        uf_live: uf_live,
        reference: reference
      )
    end
  end
end
