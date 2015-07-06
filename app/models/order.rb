class Order < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :street, :city, :state, :zipcode, :quantity

  validates_numericality_of :quantity
end
