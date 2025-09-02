require 'mysql2'

def create_client
  Mysql2::Client.new(
    host: "localhost",
    username: "hotel_user",
    password: "Senha@123",
    database: "hotel_system"
  )
end
