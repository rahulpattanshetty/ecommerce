class Address < ActiveRecord::Base
belongs_to :user
belongs_to :order


validates_presence_of :name,:street_address,:city,:pin_code
end
