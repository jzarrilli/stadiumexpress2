class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  
  PENDING = 1
  VERIFIED = 2
  FILLED = 3
  PICKED_UP = 4
  
  validates :product_id, :presence => true
  # validates :cart_id, :presence => true,

  
  def total_price
    product.price * quantity
  end
  


  
end
