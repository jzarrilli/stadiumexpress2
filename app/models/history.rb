class History < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  
  has_many :line_items
  has_many :orders, :through => :line_items
   #  
   # validates :product_id, :presence => true
   # validates :cart_id, :presence => true,
   # validates :name , :presence => true
   # validates :address , :presence => true, 
   # validates :email, :presence => true, 
   # validates :pay_type, :presence => true

  
  def total_price
    product.price * quantity
  end



  
end