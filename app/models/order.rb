require 'pusher'
class Order < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :street, :city, :state, :zipcode, :quantity

  validates_numericality_of :quantity

  scope :shipped,-> {where(shipped: true)}

  after_create :pusher_order, :pusher_who

  def ship!
    self.shipped = true
    if self.save
      pusher_ship
      true
    else
      false
    end
  end

  def self.quantity_shipped
    self.shipped.sum(:quantity).to_i
  end

  def self.quantity_ordered
    self.all.sum(:quantity).to_i
  end

  private
    def pusher_who
      Pusher['orders'].trigger('who', {
        first_name: self.first_name,
        quantity: self.quantity,
        city: self.city,
        state: self.state
      })
    end

    def pusher_ship
      quantity_shipped = Order.quantity_shipped
      Pusher['orders'].trigger('shipped', {
        message: quantity_shipped
      })
    end

    def pusher_order
      quantity_ordered = Order.quantity_ordered
      Pusher['orders'].trigger('ordered', {
        message: quantity_ordered
      })
    end
end
