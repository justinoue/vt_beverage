class Order < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :street, :city, :state, :zipcode, :quantity

  validates_numericality_of :quantity

  scope :shipped,-> {where(shipped: true)}

  after_create :pusher_order

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
    def pusher_ship
      quantity_shipped = Order.quantity_shipped
      Pusher['orders'].trigger('shipped', {
        message: "Shipped: #{quantity_shipped}"
      })
    end

    def pusher_order
      quantity_ordered = Order.quantity_ordered
      Pusher['orders'].trigger('ordered', {
        message: "Ordered: #{quantity_ordered}"
      })
    end
end
