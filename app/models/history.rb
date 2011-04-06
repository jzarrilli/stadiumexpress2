class History < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  
  def total_price
    product.price * quantity
  end
  
  def prod_tit
    product.title
  end

  def cust_name
    order.name
  end

  
end