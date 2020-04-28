class PlansController < ApplicationController
  def index
    @plans = Plan.includes(:user)
    # binding.pry
  end

  def new
    @plan = Plan.new
  end

  def create
    #binding.pry
    #Plan.create(title: post_params[:title], details: post_params[:details], image: post_params[:image], region: post_params[:region], date: post_params[:date], user_id: current_user.id)
    @plan = Plan.new(post_params)
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
    params.require(:plan).permit(:title, :details, :image, :region, :date)
  end
end
