class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      self.current_order = @order
      flash[:success] = "Your order has been successfully placed"
      redirect_to action: :success
    else
      render :new
    end
  end

  def success
    unless current_order
      redirect_to action: :new
    end
  end

  private
    def order_params
      params.require(:order).permit(
        :id,
        :first_name,
        :last_name,
        :street,
        :city,
        :state,
        :zipcode,
        :quantity,
        :stripe_token
      )
    end
end
