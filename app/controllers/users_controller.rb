class UsersController < ApplicationController
  def show
    @user = current_user
    @plans = current_user.plans
  end

  # def edit
  # end
end
