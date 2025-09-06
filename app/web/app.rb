require 'sinatra'
require 'sinatra/json'
require_relative '../../config/db'
require_relative '../models/cliente'
require_relative '../models/quarto'
require_relative '../models/reserva'

# rota inicial
get '/' do
  erb :index
end

# listar clientes (HTML)
get '/clientes' do
  db = create_client
  @clientes = db.query("SELECT * FROM clientes")
  erb :clientes
end

# listar quartos (HTML)
get '/quartos' do
  db = create_client
  @quartos = db.query("SELECT * FROM quartos")
  erb :quartos
end

# listar reservas (HTML)
get '/reservas' do
  db = create_client
  @reservas = db.query("SELECT * FROM reservas")
  erb :reservas
end
