class HistoryController < ApplicationController

  
  def index
    @line_items = LineItem.where(:status => [LineItem::VERIFIED, LineItem::PICKED_UP])
    @line_items = @line_items.order('created_at desc')
    @line_items = LineItem.paginate :page=>params[:page], :order=>'created_at desc',
    :per_page => 10
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.xml
  def show
    @line_item = LineItem.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_items }
    end
  end


end
