module SessionsHelper

  # 現在ログイン中のユーザーがいればtrue、そうでなければfalseを返す。
  def logged_in?
    !current_user.nil?
  end

end