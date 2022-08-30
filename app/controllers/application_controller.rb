class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ログイン済ユーザーのみにアクセスを許可する
  before_action :authenticate_user!
  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  $days_of_the_week = %w{日 月 火 水 木 金 土}

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

  def set_one_month 
    @first_day = params[:date].nil? ?
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    @one_month = [*@first_day..@last_day]

    @reservations = @court.reservations.where(reservation_date: (@first_day-1)..@last_day).order(:reservation_date)

    unless @one_month.count == @reservations.count
      ActiveRecord::Base.transaction do
        @one_month.each do |day| 
          @court.reservations.create(reservation_date: day)
        end
      end
      @reservations = @court.reservations.where(reservation_date: (@first_day-1)..@last_day).order(:reservation_date)
    end
  
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = "ページ情報の取得に失敗しました、再アクセスしてください。"
    redirect_to root_url
  end
  
  protected
  def configure_permitted_parameters
    # サインアップ時にnameとphone_numberのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
    # アカウント編集の時にnameとphone_numberのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
  end  

end
