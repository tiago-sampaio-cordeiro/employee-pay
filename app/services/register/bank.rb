module Register
  class Bank
    def initialize(employee:, banks:)
      @employee = employee
      @banks = banks
    end

    def call
      create_new_banks
    end

    private
    attr_reader :employee, :banks

    def create_new_banks
      Array(banks).each do |bank|
        employee.banks.create!(name: bank[:name],
                               agency: bank[:agency],
                               account: bank[:account],)
      end
    end
  end
end
