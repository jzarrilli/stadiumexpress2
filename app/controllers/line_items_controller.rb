class LineItemsController < ApplicationController
  skip_before_filter :authorize, :only => :create
  skip_before_filter :authorize, :only => :add
  skip_before_filter :authorize, :only => :remove

  
  # GET /line_items
  # GET /line_items.xml
  def index
    @line_items = LineItem.where(:status => [LineItem::VERIFIED, LineItem::FILLED])
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
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.xml
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.xml
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(store_index_url) }
        format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.xml
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, :notice => 'Line item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(line_items_url) }
      format.xml  { head :ok }
    end
  end  
  
  def fill
     @line_item = LineItem.find(params[:id])
       @line_item.status = LineItem::FILLED
       @line_item.save!
  

     respond_to do |format|
       format.html { redirect_to(line_items_url) }
       format.xml  { render :xml => @line_items }
     end
  end

     def archive
        @line_item = LineItem.find(params[:id])
          @line_item.status = LineItem::PICKED_UP
          @line_item.save!


        respond_to do |format|
          format.html { redirect_to(line_items_url) }
          format.xml  { render :xml => @line_items }
        end
   end
   
   def add
      @line_item = LineItem.find(params[:id])
        @line_item.quantity += 1
        @line_item.save!


      respond_to do |format|
        format.html { redirect_to(store_index_url) }
        format.xml  { render :xml => @line_items }
      end
   end
   
   def remove
      @line_item = LineItem.find(params[:id])
      
       if @line_item.quantity >= 1 then
        @line_item.quantity -= 1
        @line_item.save!
        
          if @line_item.quantity != 0 then
            respond_to do |format|
              format.html { redirect_to(store_index_url) }
              format.xml  { render :xml => @line_items }
            end
          else
            @line_item.destroy

             respond_to do |format|
               format.html { redirect_to(store_index_url) }
               format.xml  { render :xml => @line_items }
             end
           end
         end
     
      # else
      #         respond_to do |format|
      #           flash[:notice] = "Item quantity cannot be negative" 
      #           format.html { redirect_to store_index_url} 
      #           format.xml  { render :xml => @line_items }
      #         end
      #       end
   
  end
end