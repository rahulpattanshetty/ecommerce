class Wishlist < ActiveRecord::Base
belongs_to :product
belongs_to :user
validates_presence_of :user_id, :product_id

def save_or_update
		item=Wishlist.find_by(user_id:self.user_id, product_id:self.product_id)
		if item.nil?
			self.save
		
		end
	end

end
