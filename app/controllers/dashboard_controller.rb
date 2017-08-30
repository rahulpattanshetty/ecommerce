class DashboardController < ApplicationController
  def home
    @users = User.all
    @orders = Order.all
    @order_line_items = OrderLineItem.all
  end

  def categories
    @categories = Category.all
    @orders = Order.all 

  end

  def products
  end

  def users
  end

  def reviews
  end

  def orders
  end
end
