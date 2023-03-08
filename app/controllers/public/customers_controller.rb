class Public::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.current_customer
  end

  def confirm
    @customer = Customer.find(params[:id])
  end
end
