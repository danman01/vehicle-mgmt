class TripsController < ApplicationController
  # GET /trips
  # GET /trips.xml
  layout 'application'
  def index
	  @trips = Trip.find(:all)
  
	#@trips = Trip.paginate :page => params[:page], :per_page =>'15', :order => 'trip_id ASC'
	@current_trips= Trip.find_current_trips
  @checked_out_vehicles = Vehicle.checked_out
  @checked_in_vehicles = Vehicle.checked_in    
  @reserved_vehicles = Vehicle.reserved
  @needs_gas = Vehicle.needs_gas
  @needs_service = Vehicle.needs_service
  @current_reservations = []
  temp=Reservation.find_current_reservations
  temp.each do |t|
    if t.reserved_from >= Time.now-1000
      @current_reservations << t
    end
  end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.xml
  def show_all
@trips = Trip.paginate :page => params[:page], :per_page =>'15', :order => 'trip_id ASC'  end
  def show
    @trip = Trip.find(params[:id])
    @vehicle = Vehicle.find_by_vehicleID(@trip.vehicle_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.xml
  def new
    @trip = Trip.new
    @v = Vehicle.find(params[:id])
  	@reservations=Reservation.find_all_by_vehicle_id(@v.id)
  	@reservations_today=[]
  	@reservations_now=[]
  	@reservations.each do |r|
  	  if r.reserved_from.day==Time.now.day and r.reserved_from > Time.now-1000 and r.fulfilled==0 
  	    @reservations_today << r
  	  end
  	  if r.reserved_from.hour==Time.now.hour and r.fulfilled==0
  	    @reservations_now << r
  	  end
  	end
    @vehicle_id = params[:id]
    @reservation_id = params[:reservation_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end
  
  def return
    @trip = Trip.find(params[:id])
    @trip.check_in_time = Time.now
    @nice_time = @trip.check_in_time.strftime("%a, %b %e at %l:%M %p")
      @vehicle = Vehicle.find(@trip.vehicle_id)
  		new = {:checked_out => 0}
  		@vehicle.update_attributes(new)
      text = @vehicle.alias.to_s + ' ' + @vehicle.vehicleID.to_s + ' checked in on '+ @nice_time
      
      respond_to do |format|
        if @trip.update_attributes(params[:trip])
          flash[:notice] = text
          format.html { redirect_to(@trip) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
        end
      end
  
  
  end

  # POST /trips
  # POST /trips.xml
  def create
    @trip = Trip.new(params[:trip])
    @vehicle = Vehicle.find(@trip.vehicle_id)
    if @vehicle.checked_out?
      flash[:notice] = 'This vehicle is already in use!  Select a different one, dawg'
      redirect_to :back
    else
    
    
      respond_to do |format|
        if @trip.save
        #check out vehicle
      		new = {:checked_out => 1}
      		@vehicle.update_attributes(new)
        format.html { redirect_to(@trip) }
        format.xml  { render :xml => @trip, :status => :created, :location => @trip }
        flash[:notice] = 'Trip was successfully created. ' + @vehicle.alias.to_s + ' ' + @vehicle.vehicleID.to_s + ' checked out.'
        
        else
        format.html { render :action => "new", :id=>@vehicle.vehicleID }
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
  
  def fulfill_reservation_and_create
    @trip = Trip.new(params[:trip])
    @vehicle = Vehicle.find(@trip.vehicle_id)
    @reservation = Reservation.find_by_id(params[:reservation_id])
    if @vehicle.checked_out?
      flash[:notice] = 'This vehicle is already in use!  Select a different one, dawg'
      redirect_to :back
    else
    
    
      respond_to do |format|
        if @trip.save
        #check out vehicle
      		new = {:checked_out => 1}
      		@vehicle.update_attributes(new)
      		new = {:fulfilled =>1}
      		@reservation.update_attributes(new)
      		new = {:trip_id=>@trip.id}
      		@reservation.update_attributes(new)
        format.html { redirect_to(@trip) }
        format.xml  { render :xml => @trip, :status => :created, :location => @trip }
        flash[:notice] = 'Trip was successfully created. ' + @vehicle.alias.to_s + ' ' + @vehicle.vehicleID.to_s + ' checked out. Reservation fulfilled.'
        
        else
        format.html { render :action => "new", :id=>params[:id], :reservation_id=>params[:reservation_id] }
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.xml
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        flash[:notice] = 'Trip was successfully updated.'
        format.html { redirect_to(@trip) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.xml
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    @vehicle = Vehicle.find(@trip.vehicle_id)
    if @vehicle.checked_out = 1
		new = {:checked_out => 0}
		@vehicle.update_attributes(new)
    end
    respond_to do |format|
      format.html { redirect_to(trips_url) }
      format.xml  { head :ok }
    end
  end
  
  def explain_service
	  if params["1"]
	    render :partial => "explain_service"
	  else
	    render :partial => "explain_service"
	  end
	end
  
  
end
