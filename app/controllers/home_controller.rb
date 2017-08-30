class HomeController < ApplicationController
  def index
  	@categories = Category.order('name DESC')#or category.all will give as it is
  end
  def about
  end
  def contactUs
  end

  
end
