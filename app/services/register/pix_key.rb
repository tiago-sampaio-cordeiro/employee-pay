module Register
  class PixKey
    def initialize(employee:, pix_keys:)
      @employee = employee
      @pix_keys = pix_keys
    end

    def call
      create_new_pix_keys
    end

    private

    attr_reader :employee, :pix_keys

    def create_new_pix_keys
      Array(pix_keys).each do |key|
        employee.pix_keys.create!(key: key)
      end
    end
  end
end
