require_relative '../../config/db'

class Quarto
  attr_accessor :id, :numero, :tipo, :preco, :status

  def initialize(id: nil, numero:, tipo:, preco:, status: "disponível")
    @id = id
    @numero = numero
    @tipo = tipo
    @preco = preco
    @status = status
  end

  def save
    db = create_client
    begin
      if @id.nil?
        db.query("INSERT INTO quartos (numero, tipo, preco, status)
                  VALUES (#{@numero}, '#{@tipo}', #{@preco}, '#{@status}')")
        puts "✅ Quarto #{@numero} cadastrado!"
      else
        db.query("UPDATE quartos SET tipo='#{@tipo}', preco=#{@preco}, status='#{@status}' WHERE id=#{@id}")
        puts "✅ Quarto #{@id} atualizado!"
      end
    rescue Mysql2::Error => e
      puts "⚠️ Erro ao salvar quarto: #{e.message}"
    end
  end

  def self.all
    db = create_client
    results = db.query("SELECT * FROM quartos")
    results.each do |row|
      puts "ID: #{row['id']} | Número: #{row['numero']} | Tipo: #{row['tipo']} | Preço: R$#{row['preco']} | Status: #{row['status']}"
    end
  end
end
