class Public::AddressController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to address_index_path
  end

  def edit
  end

  private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
end
