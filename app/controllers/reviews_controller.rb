class ReviewsController < ApplicationController
before_action :authenticate_user!
before_action :set_params, only:[:show,:edit,:destroy]
def index
	@reviews=Review.all
end
def new
	@review = Review.new
end

def create

	@review = Review.new(review_params)
	@review.user_id = current_user.id
	respond_to do |format|
		#binding.pry
		if @review.save
			#Notification.review_greetings(@review).deliver!
			#redirect_to products_path, notice: "review added"
			format.js
		else
			#binding.pry

			format.js
		end
	end
	
end
def show
	
	#@product =Product.find(params[:id])
end
def edit
	
	
end
def update
	@review = Review.find(params[:id])
	
	if @review.update_attributes(review_params)
		redirect_to products_path, notice:"Review updated"
	end
	
end
def destroy
	@review.destroy
	#redirect_to products_path , notice:"successfully deleted"
	respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
end
private
	def review_params
		params[:review].permit(:product_id, :body, :rating)
		
	end
	def set_params
		@review =Review.find(params[:id])
	end

end
