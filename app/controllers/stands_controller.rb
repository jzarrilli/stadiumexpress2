class StandsController < ApplicationController
  skip_before_filter :authorize,:only => [:index, :show]
  
  # GET /stands
  # GET /stands.xml
  def index
    @stands = Stand.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stands }
    end
  end

  # GET /stands/1
  # GET /stands/1.xml
  def show
    @stand = Stand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stand }
    end
  end

  # GET /stands/new
  # GET /stands/new.xml
  def new
    @stand = Stand.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stand }
    end
  end

  # GET /stands/1/edit
  def edit
    @stand = Stand.find(params[:id])
  end

  # POST /stands
  # POST /stands.xml
  def create
    @stand = Stand.new(params[:stand])

    respond_to do |format|
      if @stand.save
        format.html { redirect_to(@stand, :notice => 'Stand was successfully created.') }
        format.xml  { render :xml => @stand, :status => :created, :location => @stand }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stands/1
  # PUT /stands/1.xml
  def update
    @stand = Stand.find(params[:id])

    respond_to do |format|
      if @stand.update_attributes(params[:stand])
        format.html { redirect_to(@stand, :notice => 'Stand was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stand.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stands/1
  # DELETE /stands/1.xml
  def destroy
    @stand = Stand.find(params[:id])
    @stand.destroy

    respond_to do |format|
      format.html { redirect_to(stands_url) }
      format.xml  { head :ok }
    end
  end
end
