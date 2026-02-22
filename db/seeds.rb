# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# cria usuários e employees
10.times do |user, employee|
  puts "criando user #{user}"
  user = User.create!(
    email_address: Faker::Internet.email,
    password: "1234",
    role: :employee,
    active: true,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  puts "criando tabela #{employee}"
  employee = Employee.create!(
    user: user,
    hourly_rate: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  )

  300.downto(0) do |i|
    puts "criando tabela de registro de pontos #{i}"
    date = i.days.ago.to_date

    clock_in = Faker::Time.between(
      from: date.to_time + 7.hours,
      to: date.to_time + 9.hours
    )

    clock_out = Faker::Time.between(
      from: clock_in + 7.hours,
      to: clock_in + 9.hours
    )

    TimePunch.create!(employee: employee, punched_at: clock_in, kind: 0)
    TimePunch.create!(employee: employee, punched_at: clock_out, kind: 1)
  end
end

puts "#{User.count} usuários criados"
puts "#{Employee.count} employees criados"
puts "#{TimePunch.count} registros de ponto criados"
