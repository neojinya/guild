class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
  end

  def create
    Plan.create(title: post_params[:title], details: post_params[:details], image: post_params[:image], region: post_params[:region], date: post_params[:date], user_id: current_user.id)
  end

  def show
  end


  
  private
  def post_params
    params.permit(:title, :details, :image, :region, :date)
  end
end
