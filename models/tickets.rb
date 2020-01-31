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


end
