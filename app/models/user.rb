class User < ActiveRecord::Base
	has_many :cart_line_items
	has_many :wishlists
	has_many :orders
	has_many :addresses
	has_many :reviews

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
