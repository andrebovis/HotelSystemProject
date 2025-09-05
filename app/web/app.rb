# app/web/app.rb
require 'sinatra'
require 'sinatra/json'
require_relative '../../config/db'
require_relative '../models/cliente'
require_relative '../models/quarto'
require_relative '../models/reserva'

get '/' do
  "🏨 Bem-vindo ao HotelProjectRuby com Sinatra!"
end

get '/clientes' do
  clientes = []
  db = create_client
  results = db.query("SELECT * FROM clientes")
  results.each { |row| clientes << row }
  json clientes
end

get '/quartos' do
  quartos = []
  db = create_client
  results = db.query("SELECT * FROM quartos")
  results.each { |row| quartos << row }
  json quartos
end

get '/reservas' do
  reservas = []
  db = create_client
  results = db.query("SELECT * FROM reservas")
  results.each { |row| reservas << row }
  json reservas
end

