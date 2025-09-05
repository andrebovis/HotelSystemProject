require_relative '../config/db'
require_relative '../app/models/cliente'
require_relative '../app/models/quarto'
require_relative '../app/models/reserva'

db = create_client
db.query("DELETE FROM reservas")
db.query("DELETE FROM quartos")
db.query("DELETE FROM clientes")

puts "🧹 Banco limpo!"

c1 = Cliente.new(nome: "João Silva", email: "joao@email.com", telefone: "99999-1111")
c1.save
c2 = Cliente.new(nome: "Maria Oliveira", email: "maria@email.com", telefone: "98888-2222")
c2.save

q1 = Quarto.new(numero: 101, tipo: "solteiro", preco: 150.0)
q1.save
q2 = Quarto.new(numero: 102, tipo: "casal", preco: 200.0)
q2.save

cliente_id = db.query("SELECT id FROM clientes WHERE email='joao@email.com'").first["id"]
quarto_id  = db.query("SELECT id FROM quartos WHERE numero=101").first["id"]

r1 = Reserva.new(cliente_id: cliente_id, quarto_id: quarto_id, data_checkin: "2025-09-10", data_checkout: "2025-09-15")
r1.save
