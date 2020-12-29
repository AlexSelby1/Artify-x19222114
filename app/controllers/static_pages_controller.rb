class StaticPagesController < ApplicationController
  def home
  end

  def registration
  end

  def login
  end

  def profile
  end

  def products
  end

  def cart
  end

  def checkout
  end

  def contact
  end

  def confirmation
    @order = Order.find(params[:id])
    @order.update_attribute(:status, "Paid With PayPal")
  end
end
