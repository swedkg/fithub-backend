class V1::ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    puts current_user
    @activities = Activity
      .where(user_id: current_user.id)

    if params[:type] == "0"
    else
      @activities = @activities
        .where(activity_type_id: params[:type])
    end

    if params[:q]
      @activities = @activities
        .where("title LIKE ? OR comment LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")
    else
    end

    @activities = @activities
      .order(params[:_sort] + " " + params[:_order])
      .page(params[:_page])
      .per_page(params[:_limit])

    puts params, @activities.count
    headers["X-Total-Count"] = @activities.count
    render json: @activities, status: :ok
  end

  def create
    new_params = params.except("activity", "controller", "action")
    Activity.create(activity_type_id: params[:activity_type_id], comment: params[:comment], date: params[:date], duration: params[:duration], title: params[:title], user_id: params[:user_id])
    head(:ok)
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
      render json: {activity: @activity, user: @activity.user, current_user: current_user}, status: :ok
    else
      head(:not_found)
    end
  end

  def update
    @activities = current_user.activities
    @activity = @activities.find(params[:id])
    if @activity.update(activity_params)
      head(:ok)
    else
      head(:not_found)
    end
  end

  def types
    @activity_types = ActivityType.all
    render json: @activity_types, status: :ok
  end

  # def user_update
  #   # :id, :first_name, :last_name, :email, :created_at, :updated_at
  #   puts params
  #   head :ok
  # end

  private

  def activity_params
    params.permit(:id, :name, :date, :duration, :title, :created_at, :updated_at, :user_id, :activity_type_id, :comment)
  end
end
