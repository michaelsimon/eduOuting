class TripsController < ApplicationController
  before_action :load_trip, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]


  def index
    @sections = Section.where(teacher_id: current_user.id)
    @trips = Trip.where(section_id: @sections)
  end

  def show
  @section = Section.find(@trip.section_id)
  @venue =   Trip.fsq_client.venue(@trip.foursquare_locid)
  @teacher = Teacher.find(@section.teacher_id)
  @photos = Trip.fsq_client.venue_photos(@trip.foursquare_locid, options = {:limit => 6}).items
  end

  def new
    @trip = Trip.new
    @sections = Section.where(teacher_id: current_user.id)

    #@venue = Trip.fsq_client.suggest_completion_venues(options = {:ll => "40.7,-74",:query => "Italian", :limit => 10})
  end

  def create
    @trip = Trip.new safe_trip_params
    @trip.public_id = SecureRandom.hex(3).upcase
    if @trip.save
      redirect_to @trip
    else
      render :new
    end
  end

  def edit
     @sections = Section.where(teacher_id: current_user.id)
     @venue_name = Trip.fsq_client.venue(@trip.foursquare_locid).name
   end

def update
    if @trip.update safe_trip_params
      redirect_to @trip
    else
      @sections = Section.where(teacher_id: current_user.id)
      render 'edit'
    end
  end

def destroy
    Trip.find_by(public_id: params[:public_id]).delete
    redirect_to trips_path
  end
  ############

  private
  def safe_trip_params
    params.require('trip').permit(:name, :section_id, :start_date, :end_date, :cost, :foursquare_locid, :details)
  end
  
  def load_trip
    @trip = Trip.where(public_id: params[:public_id]).take
  end

end