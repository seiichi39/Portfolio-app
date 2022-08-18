class UsersController < ApplicationController
  before_action :set_user, only:[:destroy]

  def new
  end

  def index
    @users = User.all
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def import
    if params[:csv_file].blank?
      redirect_to(users_index_path, alert: 'インポートするCSVファイルを選択してください')
    else
      num = User.import(params[:csv_file])
      redirect_to(users_index_path, notice: "#{num.to_s}件のユーザー情報を追加 / 更新しました")
    end
  end

end
