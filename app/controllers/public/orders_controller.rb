class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(orders_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postal_code
      @order.address
      @order.name
    end

    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    @total = 0
    @order.total_payment = @total + @order.shipping_cost
  end

  def create
    order = Order.new(orders_params)
    order.customer_id = current_customer.id
    order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item.id
      order_detail.order_id = order.id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order.shipping_cost = 800
    @total = @order.total_payment - 800
    @order_details = @order.order_details
  end

  private

  def orders_params
    params.require(:order).permit(:postal_code, :address, :name, :total_payment, :payment_method, :shipping_cost)
  end
end
