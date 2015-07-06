class HomeController < ApplicationController
  def index
    @quantity = {
      ordered: Order.quantity_ordered,
      shipped: Order.quantity_shipped
    }
    @orders = Order.order(created_at: :desc).limit(3)
  end
end
