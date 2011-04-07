class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :line_item
  belongs_to :product
  
  has_many :line_items, :dependent => :destroy
  PAYMENT_TYPES = [ "Cash", "Check", "Credit card", "PayPal" ]
  
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  
  def total_price(cart)
    cart.line_items.to_a.sum { |item| item.total_price }
  end
 
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
    


  
end
