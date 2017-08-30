class OrdersController < ApplicationController

def index
	#orders = Order.where('user_id=?',current_user.id)
	@orders = current_user.orders
	
end

def create
	@order = Order.new(order_date: Date.today, order_number: "DCT#{Random.rand(1000)}")
	@order.user_id = current_user.id
	
	@order.save
	   Notification.order_confirmation(@order).deliver!
	redirect_to orders_path, notice:"your order is been placed"	
end
end
