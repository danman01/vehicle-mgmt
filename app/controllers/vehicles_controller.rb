class VehiclesController < ApplicationController
  # GET /vehicles
  # GET /vehicles.xml
  layout 'application'
  
  def index
    @vehicles = Vehicle.all


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vehicles }
    end
  end

  # GET /vehicles/1
  # GET /vehicles/1.xml
  def show
    @vehicle = Vehicle.find(params[:id])
    @reservations = @vehicle.reservations.find_all_by_fulfilled(0)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.xml
  def new
    @vehicle = Vehicle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  # POST /vehicles
  # POST /vehicles.xml
  def create
    @vehicle = Vehicle.new(params[:vehicle])
    if @vehicle.image_url=='/images/'
      @vehicle.image_url='/images/5_Le_car_modele.jpg'
    end
    respond_to do |format|
      if @vehicle.save
        flash[:notice] = 'Vehicle was successfully created.'
        format.html { redirect_to(@vehicle) }
        format.xml  { render :xml => @vehicle, :status => :created, :location => @vehicle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.xml
  def update
    
	  @vehicle = Vehicle.find(params[:id])
    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        flash[:notice] = 'Vehicle was successfully updated.'
        format.html { redirect_to(@vehicle) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  # DELETE /vehicles/1
  # DELETE /vehicles/1.xml
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to(vehicles_url) }
      format.xml  { head :ok }
    end
  end
  def check_out
		@vehicle = Vehicle.find(params[:id])
		new = {:checked_out => 1}
		@vehicle.update_attributes(new)
		redirect_to :action => "index"
	end
	
	def check_in
		@vehicle = Vehicle.find(params[:id])
		new = {:checked_out => 0}
		@vehicle.update_attributes(new)
		redirect_to :action => "index"
	end
	def reserve
	  @vehicle = Vehicle.find(params[:id])
	  new = {:reserved => 1}
	  @vehicle.update_attributes(new)
	  @reservation = @vehicle.reservation
	end
	def release_hold
	  @vehicle = Vehicle.find(params[:id])
	  new = {:reserved => 0}
	  @vehicle.update_attributes(new)
	  redirect_to :action =>"index"
	end
	def report
	  
	end
	def show_report
	  @vehicle = Vehicle.find(params[:vehicle][:vehicle])
	  trips = Trip.find_all_by_vehicle_id(@vehicle.vehicleID)
	  @total_trips = trips.length
	  tmp_time = 0
	  tmp_destination = []
	  tmp_users = []
	  for t in trips do 
	    dif = t.check_in_time - t.check_out_time
	    tmp_time += dif
	    tmp_destination << t.destination_name
	    tmp_users << t.myid
	  end
	  #TODO strftime
	  @total_time = tmp_time
	  #TODO sort_by grep
	  @most_visited_locale = tmp_destination.uniq!

    
	  @most_active_user = tmp_users.uniq!

    
	end
	
end
