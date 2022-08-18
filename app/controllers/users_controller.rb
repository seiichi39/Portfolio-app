class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]

  def new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
    else
      render :edit
    end
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

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end

end
