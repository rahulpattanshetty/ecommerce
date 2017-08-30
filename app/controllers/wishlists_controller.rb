class WishlistsController < ApplicationController
def index
	@wishlist=Wishlist.where('user_id=?',current_user.id)
	
end
def create
	@wishlist=Wishlist.new(params[:wishlist].permit(:product_id))
	@wishlist.user_id=current_user.id
	@wishlist.save_or_update
		redirect_to wishlists_path, notice:"Added to wishlist"

	
end
def destroy
	@wishlist=Wishlist.find(params[:id])
	@wishlist.destroy
		redirect_to wishlists_path, notice: "Removed successfully"
	
end
end
