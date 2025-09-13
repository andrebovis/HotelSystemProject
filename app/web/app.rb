require 'sinatra/base'
require 'sinatra/json'
require_relative '../../config/db'
require_relative '../models/cliente'
require_relative '../models/quarto'
require_relative '../models/reserva'

class HotelApp < Sinatra::Base
  # configurações
  set :public_folder, File.expand_path('../../public', __dir__)
  set :views, File.expand_path('../views', __dir__)

  # rota inicial (página principal)
  get '/' do
    erb :index
  end

  # lista clientes (somente lado do hotel)
  get '/clientes' do
    db = create_client
    @clientes = db.query("SELECT * FROM clientes")
    erb :clientes
  end

  # lista quartos
  get '/quartos' do
    db = create_client
    @quartos = db.query("SELECT * FROM quartos")
    erb :quartos
  end

  # lista reservas
  get '/reservas' do
    db = create_client
    @reservas = db.query("SELECT * FROM reservas")
    erb :reservas
  end

  # formulário para nova reserva
  get '/reserva/nova' do
    db = create_client
    @quartos = db.query("SELECT * FROM quartos")
    erb :nova_reserva
  end

  # processa a reserva (quando o form for enviado)
  post '/reserva' do
    db = create_client

    cliente_nome  = params[:nome]
    data_checkin  = params[:checkin]
    data_checkout = params[:checkout]
    quarto_id     = params[:quarto_id]
    pagamento     = params[:pagamento]

    # cria cliente
    db.query("INSERT INTO clientes (nome) VALUES ('#{cliente_nome}')")

    # cria reserva vinculada ao cliente
    db.query("INSERT INTO reservas (cliente_id, quarto_id, data_checkin, data_checkout, metodo_pagamento)
              VALUES (LAST_INSERT_ID(), #{quarto_id}, '#{data_checkin}', '#{data_checkout}', '#{pagamento}')")

    erb :reserva_confirmada
  end
end

# executa o app
HotelApp.run! if __FILE__ == $0
