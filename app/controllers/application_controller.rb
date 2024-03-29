class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #deviseコントローラにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource.id)
    #"/user/#{current_user.id}"deviseのデフォルトパス
  end
  
  protected

  def configure_permitted_parameters
    #各動き時他カラムのストロングパラメータを追加する
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name, :nickname, :image, :self_introduction])
    devise_parameter_sanitizer.permit(:account_update,keys: [:name, :nickname, :image, :self_introduction])
  end
end
