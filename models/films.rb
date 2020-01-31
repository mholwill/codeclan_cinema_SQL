require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @price = options['price'].to_i()
  end

  def save()
    sql = "INSERT INTO films
    (
      title,
      price
    )
    VALUES
    (
      $1, $2
    ) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values)
    @id = film[0]['id'].to_i()
  end

  def update()
    sql = "UPDATE films SET
    (title, price)
    =
    ($1, $2)
    WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end


  def delete
    sql = "DELETE FROM films WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end


  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return Film.map_items(films)
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end


#refactoring code for enumeration
  def self.map_items(films_data)
    result = films_data.map {|film| Film.new(film)}
    return result
  end



end
