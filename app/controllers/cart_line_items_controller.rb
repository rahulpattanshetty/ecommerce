class CartLineItemsController < ApplicationController
	before_action :authenticate_user!
	def index
	 @cart_line_items=CartLineItem.where('user_id=?',current_user.id)	
	 	@wishlist=Wishlist.new
	 	@order=Order.new
	 	@address = Address.new
	end
def create
	@cart_line_item=CartLineItem.new(params[:cart_line_item].permit(:quantity, :product_id))
	@cart_line_item.user_id = current_user.id
	if @cart_line_item.save_or_update
		redirect_to cart_line_items_path , notice: "Successfully added"
	end	
end
def update
	@cart_line_item = CartLineItem.find(params[:id])
	if @cart_line_item.update_attributes(params[:cart_line_item].permit(:quantity))

		redirect_to cart_line_items_path, notice:"Successfully updated"
	end

end
def destroy
	@cart_line_item=CartLineItem.find(params[:id])
	@cart_line_item.destroy
	redirect_to :back, notice:"Successfully Removed "
end
end
