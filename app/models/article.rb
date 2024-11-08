class Article < ApplicationRecord
   has_many :orders
   has_many :buyers, through: :orders 
   belongs_to :vendor, class_name: "User"
end
