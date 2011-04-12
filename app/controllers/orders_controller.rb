class OrdersController < ApplicationController
  skip_before_filter :authorize# , :only => [:new, :create]
  
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.paginate :page=>params[:page], :order=>'created_at desc',
    :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])
    @hide_cart = true

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    if current_cart.line_items.empty?
      redirect_to store_index_url, :notice => "Your cart is empty"
      return
    end

    @order = Order.new
    @hide_cart = true

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to(@order, :notice =>
        'Please confirm order.') }
        Notifier.order_received(@order).deliver
        Notifier.order_confirmed(@order).deliver
        format.xml { render :xml => @order, :status => :created,
        :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def confirm
    @order = Order.find(params[:id])
    
    @order.line_items.each do |line_item|
      line_item.status = LineItem::VERIFIED
      line_item.save!
    end
    
    # respond_to do |format|
      redirect_to(thanks_url)
      # format.xml  { render :xml => @order }
    # end 
      
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end


  end

  def who_ordered
    @orders = Order.all.sort_by(&:updated_at)
  
    respond_to do |format|
      format.atom
      format.xml { render :xml => @order }
    end
    
  end
end
