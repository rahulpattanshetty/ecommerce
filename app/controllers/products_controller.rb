class ProductsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show,:sort_products]
before_action :check_is_admin, except: [:index, :show,:sort_products]

def index
	
	
	@categories = Category.all
	if params[:offset]
		#binding.pry	
		if params[:ids].blank?

			@products = Product.where(price:params[:min]..params[:max]).offset(params[:offset]).limit(10)
			#binding.pry
			render json: {products:@products.map{|p| p.attributes.merge({category_name: p.category.name})}}
		else
			@products = Product.where(category_id:params[:ids].split(",")).where(price:params[:min]..params[:max]).offset(params[:offset]).limit(10)
			#binding.pry
			render json: {products:@products.map{|p| p.attributes.merge({category_name: p.category.name})}}
		end
		
		
	else

		@products = Product.limit(10)
	end
	
end


def new 
	@product = Product.new	
end

def create
	@product = Product.new(params[:product].permit(:name, :category_id, :description, :price, :code, :stock, :cod_eligible))
	if @product.save
		redirect_to products_path, notice: "successfully created the product"
	else
		render action: "new"
	end
end
def show
	@product = Product.find(params[:id])
	#@category=Category.find(@product.category_id)
	@cart_line_item = CartLineItem.new
	@review =Review.new	
	@reviews=Review.where('product_id=?',@product.id)
	
end
def edit
	@product = Product.find(params[:id])
end
def update
	@product =Product.find(params[:id])
	if @product.update_attributes(params[:product].permit(:name, :category_id, :description, :price, :code, :stock, :cod_eligible))
		redirect_to product_path(@product.id), notice: "successfully updated the product"
	else
		render action: "edit"
	end
end
def destroy
	@product = Product.find(params[:id])
	@product.destroy
	redirect_to products_path, notice: "successfully destroyed the product"

end

end
