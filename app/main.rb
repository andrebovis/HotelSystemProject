require_relative '../config/db'
require_relative 'models/cliente'
require_relative 'models/quarto'
require_relative 'models/reserva'



cliente = Cliente.new(nome: "João Silva", email: "joao@email.com", telefone: "9999-9999")
cliente.save

Cliente.all

quarto = Quarto.new(numero: 101, tipo: "Casal", preco: 250.00)
quarto.save

Quarto.all

reserva = Reserva.new(cliente_id: 1, quarto_id: 1, data_checkin: "2025-09-01", data_checkout: "2025-09-05")
reserva.save

Reserva.all
