require_relative 'db'

class Cliente
  attr_accessor :id, :nome, :email, :telefone

  def initialize(id: nil, nome:, email:, telefone:)
    @id = id
    @nome = nome
    @email = email
    @telefone = telefone
  end

  # Criar cliente
  def save
    db = create_client
    if @id.nil?
      db.query("INSERT INTO clientes (nome, email, telefone)
                VALUES ('#{@nome}', '#{@email}', '#{@telefone}')")
      puts "✅ Cliente #{@nome} cadastrado!"
    else
      db.query("UPDATE clientes SET nome='#{@nome}', email='#{@email}', telefone='#{@telefone}' WHERE id=#{@id}")
      puts "✅ Cliente #{@id} atualizado!"
    end
  end

  # Listar todos
  def self.all
    db = create_client
    results = db.query("SELECT * FROM clientes")
    results.each do |row|
      puts "ID: #{row['id']} | Nome: #{row['nome']} | Email: #{row['email']} | Telefone: #{row['telefone']}"
    end
  end
end
