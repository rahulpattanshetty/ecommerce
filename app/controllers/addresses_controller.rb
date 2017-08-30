class AddressesController < ApplicationController


def index
	
	@addresses = current_user.addresses
	
end
def new
	@address = Address.new
	
end

def create
	@address = Address.new(params[:address].permit(:name,:street_address,:city,:pin_code,:landmark))
	@address.user_id=current_user.id
	@address.save
	redirect_to cart_line_items_path, notice:"Address added successfully"

end
def update
	@address = Address.find(params[:id])
	@order = Order.find('user_id=?',@address.user_id)
	#if @order.update_attributes(params[:order].permit(:address_id))
	#redirect_to cart_line_items_path
	#end
end

end
