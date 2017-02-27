class TripsController < ApplicationController
  before_action :get_trip, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    @trips = Trip.joins(section: :teacher).where(teachers: {id: current_user.id})
  end

  def show
    @venue =   Trip.fsq_client.venue(@trip.foursquare_locid)
    @photos = Trip.fsq_client.venue_photos(@trip.foursquare_locid, options = {:limit => 6}).items
  end

  def new
    @trip = Trip.new
    @sections = Section.where(teacher_id: current_user.id)
  end

  def create
    @trip = Trip.new(trip_params)
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
    if @trip.update(trip_params)
      redirect_to @trip
    else
      @sections = Section.where(teacher_id: current_user.id)
      render 'edit'
    end
  end

  def destroy
    if @trip.delete
      redirect_to trips_path
    else
      redirect_to trips_path
      end
  end

  private
  def trip_params
    params.require(:trip).permit(:name, :section_id, :start_date, :end_date, :cost, :foursquare_locid, :details)
  end

  def get_trip
    @trip = Trip.find_by(public_id: params[:public_id])
  end

end
