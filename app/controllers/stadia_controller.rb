class StadiaController < ApplicationController
  # GET /stadia
  # GET /stadia.xml
  def index
    @stadias = Stadium.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stadias }
    end
  end

  # GET /stadia/1
  # GET /stadia/1.xml
  def show
    @stadium = Stadium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stadium }
    end
  end

  # GET /stadia/new
  # GET /stadia/new.xml
  def new
    @stadium = Stadium.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stadium }
    end
  end

  # GET /stadia/1/edit
  def edit
    @stadium = Stadium.find(params[:id])
  end

  # POST /stadia
  # POST /stadia.xml
  def create
    @stadium = Stadium.new(params[:stadium])

    respond_to do |format|
      if @stadium.save
        format.html { redirect_to(@stadium, :notice => 'Stadium was successfully created.') }
        format.xml  { render :xml => @stadium, :status => :created, :location => @stadium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stadium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stadia/1
  # PUT /stadia/1.xml
  def update
    @stadium = Stadium.find(params[:id])

    respond_to do |format|
      if @stadium.update_attributes(params[:stadium])
        format.html { redirect_to(@stadium, :notice => 'Stadium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stadium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stadia/1
  # DELETE /stadia/1.xml
  def destroy
    @stadium = Stadium.find(params[:id])
    @stadium.destroy

    respond_to do |format|
      format.html { redirect_to(stadias_url) }
      format.xml  { head :ok }
    end
  end
end
