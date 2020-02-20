class UsersController < ApplicationController
  def show
    #@user = User.find(params[:id])
    @name = current_user.name
    @nickname = current_user.nickname
    @image = current_user.image
    @self_introduction = current_user.self_introduction
    @plans = Plan.where(user_id: current_user.id)
  end
end
