class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_user
    if params[:id] == "sign_out"
      redirect_to controller: 'users/sessions', action: 'destroy'
    else
      @user = User.find(params[:id])
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected
  def configure_permitted_parameters
    # サインアップ時にnameとphone_numberのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
    # アカウント編集の時にnameとphone_numberのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
  end  

end
