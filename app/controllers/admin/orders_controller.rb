class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order.shipping_cost = 800
    @total = @order.total_payment - 800
    @order_details = @order.order_details
  end

  def status
    order = Order.find(params[:id])
    order.update(order_params)
    #if status == 1
      #order.order_details.making_status = 1
      #redirect_to admin_order_path(order.id)
    #else
    redirect_to admin_order_path(order.id)
    #end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
