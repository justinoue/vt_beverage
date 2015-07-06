module Core
  extend ActiveSupport::Concern

  included do
    helper_method :current_order
  end

  def current_order
    @current_order ||= Order.find_by(id: session['order.id']) if session['order.id']
    unless @current_order
      session['order.id'] = nil
    end
    @current_order
  end

  def current_order=(order)
    session['order.id'] = order.id
    @current_order = order
  end
end
