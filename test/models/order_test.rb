require 'test_helper'
 
class OrderTest < ActiveSupport::TestCase
  test "should not save empty order" do
    order = Order.new
    assert_not order.save, "saved empty order."
  end

  test "should save complete order" do
    order = Order.new({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code,
      quantity: Random.rand(1...100)
    })

    assert order.save, "saved complete order."
  end

  test "should ship order" do
    order = Order.new({
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zipcode: Faker::Address.zip_code,
      quantity: Random.rand(1...100)
    })
    order.save

    assert order.ship! && order.shipped, "shipped order"
  end
end
