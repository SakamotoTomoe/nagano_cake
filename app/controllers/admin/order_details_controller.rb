class Admin::OrderDetailsController < ApplicationController
  def production
    order_detail = OrderDetail.find(params[:id])
    order = order_detail.order
    order_details = order.order_details
    order_detail.update(order_detail_params)
    if order_detail.making_status == "making"
      order_detail.order.update(status: "making")
    elsif order_details.complete.count == order_details.count
      order_detail.order.update(status: "send_prepare")
    end
    redirect_to admin_order_path(order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
