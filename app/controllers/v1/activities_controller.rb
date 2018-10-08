class V1::ActivitiesController < ApplicationController

  # before_action :authenticate_user!


  def index
    @activities = Activity.all
    # @activities = current_user.activities
    puts params
    render json: @activities, status: :ok
  end

  def create
    @activity = Activity.new(activity_params)
    
    @activity.save
    render json: @activity, status: :created
  end
  
  
  def destroy
    @activity = Activity.where(id: params[:id]).first  
    if @activity.destroy
      head(:ok)
    else
      head(:not_found)
    end
  end
  
  def show
    @activities = current_user.activities
    @activity = @activities.find(params[:id])
    if @activity
      # //  {user: user, authentication_token: token}, status: :created
      render json: {activity: @activity, user: @activity.user, current_user: current_user}, status: :ok
    else
      head(:not_found)
    end
  end 

  def update
    @activities = current_user.activities
    @activity = @activities.find(params[:id])
     if @activity.update(activity_params)
      render json: @activity, status: :ok
    else
      head(:not_found)
    end
  end

  private
  def activity_params
    params.permit(:id, :name, :date, :duration)
  end
  
end
