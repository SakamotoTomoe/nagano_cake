class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    cart_items = current_customer.cart_items.new(cart_items_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    else
      cart_items.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_items = CartItem.find(params[:id])
    cart_items.customer_id = current_customer.id
    cart_items.update(cart_items_params)
    redirect_to cart_items_path
  end

  def all_destroy
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:amount, :customer_id, :item_id)
  end

end
