class V1::ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @activities = current_user.activities
    puts current_user
    # puts @activities
    @activities = Activity
      .where(user_id: current_user.id)
    # .where(user_id: params[:user_id])

    if params[:type] == "0"
      puts "--> show all ctivities!!"
    else
      @activities = @activities
        .where(activity_type_id: params[:type])
    end

    if params[:q]
      @activities = @activities
        .where("title LIKE ? OR comment LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")
    else
      puts "--> lets move on!!"
    end

    @activities = @activities
      .order(params[:_sort] + " " + params[:_order])
      .page(params[:_page])
      .per_page(params[:_limit])

    puts params, @activities.count
    headers["X-Total-Count"] = @activities.count
    render json: @activities, status: :ok
    # render json: @activities, status: :ok
  end

  def create
    puts "-------------------> Create params:", params
    new_params = params.except("activity", "controller", "action")
    puts "-------------------> new_params:", new_params
    # @activity = Activity.create(params)
    # puts "-------------------> @activity:", @activity
    Activity.create(activity_type_id: params[:activity_type_id], comment: params[:comment], date: params[:date], duration: params[:duration], title: params[:title], user_id: params[:user_id])
    head(:ok)
    # @activity.save
    # if @activity.save
    #   head(:created)
    # else
    #   head(:not_found)
    # end
    # render json: @activity, status: :created
  end

  def destroy
    @activity = Activity.where(id: params[:id]).first
    puts "------------> destroy:", params, @activity
    if @activity.destroy
      head(:ok)
    else
      head(:not_found)
    end
  end

  def show
    @activities = current_user.activities
    # @activities = Activity.all.where(user_id: params[:user_id])
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
    puts "------------> update:", params, @activity
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
