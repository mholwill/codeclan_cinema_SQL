require_relative ('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i()
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      funds
    )
    VALUES
    (
      $1, $2
    ) RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)
    @id = customer[0]['id'].to_i()
  end


  def update()
    sql = "UPDATE customers SET
    (name, funds)
    =
    ($1, $2)
    WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def films
    sql = "SELECT films.* FROM films
    INNER JOIN tickets
    ON tickets.film_id = films.id
    WHERE customer_id = $1"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return Film.map_items(film_data)
  end

  def tickets_bought
    sql = "SELECT * FROM tickets
    WHERE customer_id = $1"
    values = [@id]
    return SqlRunner.run(sql, values).count
  end

  def decrease_funds(film)
    self.funds -= film.price
    return self.funds
    self.update
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return Customer.map_items(customers)
  end


  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

#refactoring code for enumeration
  def self.map_items(customers_data)
    result = customers_data.map {|customer| Customer.new(customer)}
    return result
  end



end
