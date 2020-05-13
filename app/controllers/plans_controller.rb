class PlansController < ApplicationController
  def index
    @plans = Plan.includes(:user)
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
    end
    
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

  def plan_params
    params.require(:plan).permit(:title, :details, :image, :region, :date).merge(user_id: current_user.id)
  end
end
