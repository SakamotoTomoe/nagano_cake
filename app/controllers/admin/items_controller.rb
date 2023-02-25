class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private

  def post_image_params
    params.require(:items).permit(:image)
  end
end
