require_relative '../../config/db'

class Reserva
  attr_accessor :id, :cliente_id, :quarto_id, :data_checkin, :data_checkout

  def initialize(id: nil, cliente_id:, quarto_id:, data_checkin:, data_checkout:)
    @id = id
    @cliente_id = cliente_id
    @quarto_id = quarto_id
    @data_checkin = data_checkin
    @data_checkout = data_checkout
  end

  def save
    db = create_client
    if @id.nil?
      db.query("INSERT INTO reservas (cliente_id, quarto_id, data_checkin, data_checkout)
                VALUES (#{@cliente_id}, #{@quarto_id}, '#{@data_checkin}', '#{@data_checkout}')")
      puts "✅ Reserva criada!"
    else
      db.query("UPDATE reservas SET cliente_id=#{@cliente_id}, quarto_id=#{@quarto_id}, data_checkin='#{@data_checkin}', data_checkout='#{@data_checkout}' WHERE id=#{@id}")
      puts "✅ Reserva #{@id} atualizada!"
    end
  end

  def self.all
    db = create_client
    results = db.query("
      SELECT r.id, c.nome AS cliente, q.numero AS quarto, r.data_checkin, r.data_checkout
      FROM reservas r
      JOIN clientes c ON r.cliente_id = c.id
      JOIN quartos q ON r.quarto_id = q.id
    ")
    results.each do |row|
      puts "ID: #{row['id']} | Cliente: #{row['cliente']} | Quarto: #{row['quarto']} | Check-in: #{row['data_checkin']} | Check-out: #{row['data_checkout']}"
    end
  end
end
