class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  before_action :admin_user, only: :index

  def new
  end

  def show
  end

  def edit
  end

  def update
    unless user_params[:phone_number] = "00000000000"
      if @user.update_attributes(user_params)
        flash[:success] = "ユーザー情報を更新しました。"
        redirect_to root_url
      else
        render :edit
      end
    else
      flash[:danger] = "電話番号を修正してください。"
      render :edit
    end
  end

  def index
    @users = User.search(params[:search])
  end

  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end

end
