require 'mysql2'

db_client = Mysql2::Client.new(
  host: "localhost",
  username: "hotel_user",
  password: "senha123", # coloca a senha que você usou
  database: "hotel_system"
)

puts "Conectado ao MySQL!"
