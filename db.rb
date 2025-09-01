require 'mysql2'

client = Mysql2::Client.new(
  host: "localhost",
  username: "hotel_user",
  password: "Senha@123",
  database: "hotel_system"
)

puts "Conexão realizada com sucesso!"
