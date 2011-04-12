class Order < ActiveRecord::Base
  belongs_to :cart
  belongs_to :line_item
  belongs_to :product
  belongs_to :credit 
  
  has_many :line_items, :dependent => :destroy
  PAYMENT_TYPES = [ "FREE - Demo","Cash", "Credit"]
  
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES
  
  def time
    created_at
  end
  
  def total_price
    line_items.to_a.sum {|li| li.total_price}
  end
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
  
  def product_names
    line_items.map(&:product).map(&:title)
  end
end
