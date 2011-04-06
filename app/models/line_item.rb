class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  
  validates :product_id, :presence => true
  # validates :cart_id, :presence => true,
  
  def total_price
    product.price * quantity
  end
  
  def order_status
    order.status
  end 
  
  # def prod_tit
  #     product.title
  #   end
  # 
  #   def cust_name
  #     order.name
  #   end

  
end
