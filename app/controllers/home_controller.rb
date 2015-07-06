class HomeController < ApplicationController
  def index
    @quantity = {
      ordered: Order.quantity_ordered,
      shipped: Order.quantity_shipped
    }
  end
end
