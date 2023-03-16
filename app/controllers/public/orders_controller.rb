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
    order.save
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
  end

  private

  def orders_params
    params.require(:order).permit(:postal_code, :address, :name, :total_payment, :payment_method, :status, :customer_id)
  end
end
