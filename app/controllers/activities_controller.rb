class ActivitiesController < ApplicationController
  before_action :find_activity, only: [:show]

  def index
    @activities = Activity.all
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude
      }
    end
  end

  def show
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to activities_path
    else
      render :new
    end
  end

  private

  def find_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :category, :description, :address)
  end
end
