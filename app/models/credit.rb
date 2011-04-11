class Credit < ActiveRecord::Base
  belongs_to :order
  belongs_to :line_item
  
end
