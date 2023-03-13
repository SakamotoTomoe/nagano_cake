class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  enum payment_method: {credit_card:0, transfer:1}
  
  def subtotal
    item.price * 1.10 * cart_item.amount
  end
  
end
