require 'sinatra/base'
require 'sinatra/json'
require_relative '../../config/db'
require_relative '../models/cliente'
require_relative '../models/quarto'
require_relative '../models/reserva'

class HotelApp < Sinatra::Base
  # configurações corretas dentro da classe
  set :public_folder, File.expand_path('../../public', __dir__)
  set :views, File.expand_path('../views', __dir__)

  # rota inicial
  get '/' do
    erb :index
  end

  get '/clientes' do
    db = create_client
    @clientes = db.query("SELECT * FROM clientes")
    erb :clientes
  end

  get '/quartos' do
    db = create_client
    @quartos = db.query("SELECT * FROM quartos")
    erb :quartos
  end

  get '/reservas' do
    db = create_client
    @reservas = db.query("SELECT * FROM reservas")
    erb :reservas
  end
end
