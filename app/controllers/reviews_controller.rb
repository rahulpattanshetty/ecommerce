class ReviewsController < ApplicationController
before_action :authenticate_user!
def index
	@reviews=Review.all
end
def new
	@review = Review.new
end

def create

	@review = Review.new(params[:review].permit(:product_id, :body, :rating))
	@review.user_id=current_user.id
	if @review.save
		Notification.review_greetings(@review).deliver!
		redirect_to products_path, notice: "review added"
	end
	
end
def show
	@review = Review.find(params[:id])
	#@product =Product.find(params[:id])
end
def edit
	@review = Review.find(params[:id])
	
end
def update
	@review = Review.find(params[:id])
	
	if @review.update_attributes(params[:review].permit(:body, :rating))
		redirect_to products_path, notice:"Review updated"
	end
	
end
def destroy
	@review =Review.find(params[:id])
	@review.destroy

	redirect_to products_path , notice:"successfully deletedS"
end
end
