require 'sinatra'
require 'sinatra/json'

require_relative 'config/db'
require_relative 'app/models/cliente'
require_relative 'app/models/quarto'
require_relative 'app/models/reserva'

require_relative 'app/web/app'

set :bind, '0.0.0.0'
set :port, 4567
