class PlansController < ApplicationController
  def index
    @plans = Plan.includes(:user)
  end

  def new
  end

  def create
    Plan.create(title: post_params[:title], details: post_params[:details], image: post_params[:image], region: post_params[:region], date: post_params[:date], user_id: current_user.id)
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    if plan.user_id == current_user.id
      plan.update(post_params)
      redirect_to '/'
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy if plan.user_id == current_user.id
  end


  
  private
  def post_params
    params.permit(:title, :details, :image, :region, :date)
  end
end
