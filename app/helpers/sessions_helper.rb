module SessionsHelper

  # 現在ログイン中のユーザーがいればtrue、そうでなければfalseを返す。
  def logged_in?
    !current_user.nil?
  end
  
  # 渡されたユーザーがログイン済みのユーザーであればtrueを返す。
  def current_user?(user)
    user == current_user
  end

end