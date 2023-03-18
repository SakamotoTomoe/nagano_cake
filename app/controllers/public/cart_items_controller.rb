class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    cart_items = CartItem.new(cart_items_params)
    cart_items = Item.find_by(name: "ショートケーキ")
    if cart_items.name == "ショートケーキ"
      cart_items.amount + cart_item.amount
    else
      CartItem.new(cart_items_params)
    end
    cart_items.save
    redirect_to cart_items_path
  end

  def update
    cart_items = CartItem.find(params[:id])
    cart_items.customer_id = current_customer.id
    cart_items.update(cart_items_params)
    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:amount, :customer_id, :item_id)
  end

end
