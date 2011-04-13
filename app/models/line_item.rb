class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  
  PENDING = 1
  VERIFIED = 2
  FILLED = 3
  PICKED_UP = 4
  
  def word
    if status == 2
      "Waiting"
    else
      if status == 3
        "Filled"
      end
    # else 
    #    "Picked-Up"
    end
  end 
  
  validates :product_id, :presence => true
  # validates :cart_id, :presence => true,

  
  def total_price
    product.price * quantity
  end
  
  
end