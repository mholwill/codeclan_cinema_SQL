require('pry-byebug')

require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()

#Customers
  customer1 = Customer.new ({
    'name' => 'Graham',
    'funds' => 40
  })
  customer1.save()

customer2 = Customer.new ({
    'name' => 'Fraser',
    'funds' => 20
  })
customer2.save()

customer3 = Customer.new ({
    'name' => 'Sarah',
    'funds' => 30
  })
customer3.save()

customer4 = Customer.new ({
    'name' => 'Jess',
    'funds' => 15
  })
customer4.save()

#Films
film1 = Film.new ({
    'title' => 'Bad Boys',
    'price' => 12
  })
film1.save()

film2 = Film.new ({
    'title' => 'Stardust',
    'price' => 8
  })
film2.save()

film3 = Film.new ({
    'title' => 'Star Wars',
    'price' => 12
  })
film3.save()

#Tickets
ticket1 = Ticket.new ({
    'customer_id' => customer1.id,
    'film_id' => film1.id
  })
ticket1.save()

ticket2 = Ticket.new ({
    'customer_id' => customer2.id,
    'film_id' => film1.id
  })
ticket2.save()

ticket3 = Ticket.new ({
    'customer_id' => customer4.id,
    'film_id' => film1.id
  })
ticket3.save()

ticket4 = Ticket.new ({
    'customer_id' => customer3.id,
    'film_id' => film2.id
  })
ticket4.save()

ticket5 = Ticket.new ({
    'customer_id' => customer1.id,
    'film_id' => film3.id
  })
ticket5.save()

ticket6 = Ticket.new ({
    'customer_id' => customer3.id,
    'film_id' => film3.id
  })
ticket6.save()

ticket7 = Ticket.new ({
    'customer_id' => customer1.id,
    'film_id' => film2.id
  })
ticket7.save()

binding.pry
nil
