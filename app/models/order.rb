class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: {credit_card:0, transfer:1}

  enum status: {wait_payment:0, confirm_payment:1, making:2, send_prepare:3, send_complete:4}

  def subtotal
    item.price * 1.10 * cart_item.amount
  end

  def order_item_amount
    amount = 0
    order_details.each do |order_detail|
      amount = amount + order_detail.amount
    end
    return amount
  end

end
