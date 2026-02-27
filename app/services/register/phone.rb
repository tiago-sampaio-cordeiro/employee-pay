module Register
  class Phone
    def initialize(employee:, phone_numbers:)
      @employee = employee
      @phone_numbers = phone_numbers
    end

    def call
      create_new_phone_numbers
    end

    private

    attr_reader :employee, :phone_numbers

    def create_new_phone_numbers
      Array(phone_numbers).each do |number_phone|
        employee.phones.create!(number: number_phone)
      end
    end
  end
end
