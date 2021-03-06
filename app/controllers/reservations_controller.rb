class ReservationsController < ApplicationController
  # GET /reservations
  # GET /reservations.xml
  layout 'application'
  
  def index
    @reservations = Reservation.all
    @reserved_vehicles = Vehicle.reserved

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.xml
  def show
    @reservation = Reservation.find(params[:id])
    @reserved_vehicles = Vehicle.reserved

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.xml
  def new
    @reservation = Reservation.new
    @vehicle_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reservation }
    end
  end

  # GET /reservations/1/edit
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # POST /reservations
  # POST /reservations.xml
  def create
    @reservation = Reservation.new(params[:reservation])
    @vehicle = Vehicle.find(@reservation.vehicle_id)
    
    respond_to do |format|
      if @reservation.save
        flash[:notice] = 'Reservation was successfully created.'
        format.html { redirect_to(@reservation) }
        format.xml  { render :xml => @reservation, :status => :created, :location => @reservation }
        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.xml
  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        flash[:notice] = 'Reservation was successfully updated.'
        format.html { redirect_to(@reservation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.xml
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    
    @vehicle = Vehicle.find(@reservation.vehicle_id)
    if @vehicle.reserved?
		new = {:reserved => 0}
		@vehicle.update_attributes(new)
    end
    respond_to do |format|
      format.html { redirect_to(:back) }
      format.xml  { head :ok }
    end
  end
  
  
end
