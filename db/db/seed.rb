require_relative '../app/models/cliente'
require_relative '../app/models/quarto'
require_relative '../app/models/reserva'

# Criar clientes
c1 = Cliente.new(nome: "João Silva", email: "joao@email.com", telefone: "99999-1111")
c1.save
c2 = Cliente.new(nome: "Maria Oliveira", email: "maria@email.com", telefone: "98888-2222")
c2.save

# Criar quartos
q1 = Quarto.new(numero: 101, tipo: "Casal", preco: 150.0)
q1.save
q2 = Quarto.new(numero: 102, tipo: "Solteiro", preco: 100.0)
q2.save

# Criar reservas
r1 = Reserva.new(cliente_id: 1, quarto_id: 1, data_checkin: "2025-09-10", data_checkout: "2025-09-12")
r1.save
