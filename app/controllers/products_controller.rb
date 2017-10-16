class ProductsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]
before_action :check_is_admin, except: [:index, :show]

def index
	@products = Product.all
	@categories = Category.all
	if params[:ids]
		@products = Product.where(category_id:params[:ids].split(","))
		if @products.empty?
			@products = Product.all
			render json: @products.map{|p| p.attributes.merge({category_name: p.category.name})}
		else
			render json: @products.map{|p| p.attributes.merge({category_name: p.category.name})}
		end
	end
	if params[:search]
		@products = Product.where('name LIKE ?',"%#{params[:search]}%")
		if @products.empty?
			 @products = Product.all
		else
			@products
		end
	end
	if params[:sort]
		@products = Product.where('price <= ?',params[:sort]);
		render json: @products
	end
	#binding.pry
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
