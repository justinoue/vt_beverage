class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :street
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.string  :quantity
      t.string  :stripe_token
      t.timestamps
    end
  end
end
