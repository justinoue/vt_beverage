task simulate_activity: :environment do
  i = 0
  while i < 3
    order = create_new_order
    random_sleep

    if i == Random.rand(0...2)
      puts 'Shipping Order...'
      order.ship!
      puts 'Order Shipped.'
      random_sleep
    end

    if i == 2
      i = 0
    end

    random_sleep
  end
end
  
def random_sleep
  puts 'Sleeping...'
  sleep Random.rand(1...3)
end

def create_new_order
  puts 'Creating new order...'
  order = Order.new({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    street: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zipcode: Faker::Address.zip_code,
    quantity: Random.rand(1...100)
  })
  order.save!
  puts 'Order created.'
  order
end
