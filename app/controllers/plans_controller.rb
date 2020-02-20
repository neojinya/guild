class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
  end

  def create
    Plan.create(post_params)
  end

  def show
  end


  
  private
  def post_params
    params.permit(:title, :details, :image, :region, :date)
  end
end
