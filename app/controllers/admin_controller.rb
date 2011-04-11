class AdminController < ApplicationController
  def index
    @total_orders = LineItem.where(:status => LineItem::VERIFIED).count
  end

end
