require('pry-byebug')

require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

#Customers
customer1 = Customer.new ({
    'name' => 'Graham',
    'funds' => 40
  })

customer2 = Customer.new ({
    'name' => 'Fraser',
    'funds' => 20
  })

customer3 = Customer.new ({
    'name' => 'Sarah',
    'funds' => 30
  })

customer4 = Customer.new ({
    'name' => 'Jess',
    'funds' => 15
  })

#Films
film1 - Film.new ({
    'title' => 'Bad Boys',
    'price' => 12
  })

film2 - Film.new ({
    'title' => 'Stardust',
    'price' => 8
  })

film3 - Film.new ({
    'title' => 'Star Wars',
    'price' => 12
  })

#Tickets
ticket1 = Ticket.new ({
    'customer_id' => customer1.id,
    'film_id' => film1.id
  })

ticket2 = Ticket.new ({
    'customer_id' => customer2.id,
    'film_id' => film1.id
  })

ticket3 = Ticket.new ({
    'customer_id' => customer4.id,
    'film_id' => film1.id
  })

ticket4 = Ticket.new ({
    'customer_id' => customer3.id,
    'film_id' => film2.id
  })

ticket5 = Ticket.new ({
    'customer_id' => customer1.id,
    'film_id' => film3.id
  })

ticket6 = Ticket.new ({
    'customer_id' => customer3.id,
    'film_id' => film3.id
  })

ticket7 = Ticket.new ({
    'customer_id' => customer1.id,
    'film_id' => film2.id
  })
