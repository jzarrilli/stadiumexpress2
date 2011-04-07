class HistoryController < ApplicationController
  def index
    @line_items = LineItem.where(:status => [LineItem::PICKED_UP])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end



end
