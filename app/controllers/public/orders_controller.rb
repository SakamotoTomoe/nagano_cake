class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
  end

  def show
  end
  
  def confirm
    @order = Order.new(orders_params)
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    @total = 0
    @total_payment = @order.shipping_cost + (@total + cart_item.subtotal)
  end
  
  private
  
  def orders_params
    params.require(:order).permit(:postal_code, :address, :name, :total_payment, :payment_method, :status, :customer_id)
  end
end
