require_relative('../db/sql_runner')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end

  def save()
    sql = "INSERT INTO tickets
    (
      customer_id,
      film_id
    )
    VALUES
    (
      $1, $2
    ) RETURNING id"
    values = [@customer_id, @film_id]
    ticket = SqlRunner.run(sql, values)
    @id = ticket[0]['id'].to_i()
  end

  def update()
    sql = "SELECT tickets SET
    (customer_id, film_id)
    =
    ($1, $2)
    WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM tickets WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end
  
  def film()
    sql = "SELECT * FROM films
    WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values).first
    return Film.new(film)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return Ticket.map_items(tickets)
  end

  def self.delete_all
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end


#refactoring code for enumeration
  def self.map_items(tickets_data)
    result = tickets_data.map {|ticket| Ticket.new(ticket)}
    return result
  end


end
