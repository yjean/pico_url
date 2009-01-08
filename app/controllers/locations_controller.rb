class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    if params[:tinyurl]
      begin
        location = Location.find_by_id(params[:tinyurl])
        redirect_to location.url, :status => :moved_permanently
      rescue Exception => e
        # i try to use flash[:error] but it's displayed :-(
        # flash[:error] = 'This pico_url doesn\'t exists. Please enter below the full url.'
        flash[:notice] = 'This pico_url doesn\'t exists. Please enter below the full url.'
        redirect_to :action => "new"
      end
    else
      @location = Location.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @location }
      end
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { 
          loc = Location.find_by_url(params[:location][:url])
          # render :action => "show" 
          redirect_to(loc)
        }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
end
