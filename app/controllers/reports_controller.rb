class ReportsController < ApplicationController
  def index
    #time=params[:time] || 2010
    #vehicle=Vehicle.find(params[:vehicle]) || Vehicle.find(94132)
    @all_trips=Trip.find(:all)
    @vehicles=[]
    @people=[]
    #finding most used people
    for trip in @all_trips
      @people << trip.myid
    end
    freqs = Hash.new(0)
      @people.each { |myid| freqs[myid] +=1}
      freqs = freqs.sort_by{|x,y| y }
      freqs.reverse!
      @people_count=[]
      n=0
      @people.clear
        freqs.each do |x, freq|
          @people << x
          @people_count << freq
          n+=1
        end
    #finding most used vehicle
    for trip in @all_trips
      @vehicles << trip.vehicle_id
    end
    freqs = Hash.new(0)
      @vehicles.each { |id| freqs[id] +=1}
      freqs = freqs.sort_by{|x,y| y }
      freqs.reverse!
      @vehicle_count=[]
      n=0
      @vehicles.clear
        freqs.each do |x, freq|
          @vehicles << x
          @vehicle_count << freq
          n+=1
        end
    @most_used_vehicle=@vehicles[0] rescue 'na'
    @most_used_person=@people[0] rescue 'na'
  end
  

end
