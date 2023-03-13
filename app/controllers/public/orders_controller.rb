class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end
  
  def confirm
    @cart_items = current_customer.cart_items
    @total = 0
    @total_payment = @order.shipping_cost + (@total + cart_item.subtotal)
  end
end
