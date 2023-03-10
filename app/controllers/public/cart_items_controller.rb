class Public::CartItemsController < ApplicationController
  def index
    @cart_item = current_customer.
    @items = Item.current_customer_id
  end

  def create
    cart_items = CartItem.new(cart_items_params)
    cart_items.save
    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:amount, :customer_id, :item_id)
  end

end
