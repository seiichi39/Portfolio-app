class CourtsController < ApplicationController
  before_action :admin_user, only: [:new, :edit, :show_admin, :index]
  before_action :non_admin_user, only: :show
  before_action :set_court, only: [:edit, :update, :show, :show_admin, :destroy]
  before_action :set_one_month, only: [:show, :show_admin]

  def new
    @court = Court.new
  end

  def create
    @court = Court.new(court_params)
    if @court.save
      flash[:success] = '新規作成に成功しました'
      redirect_to courts_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @court.update_attributes(court_params)
      flash[:success] = "更新しました。"
      redirect_to courts_url
    else
      render :edit
    end
  end

  def before_show
    redirect_to court_path(id: params[:court_id])
  end

  def show
  end

  def before_show_admin
    redirect_to show_admin_court_path(id: params[:court_id])
  end 

  def show_admin
  end

  def index
    @courts = Court.all.order(id: "ASC")
  end

  def destroy
    @court.destroy
    flash[:success] = "#{@court.court_name}のデータを削除しました。"
    redirect_to courts_url
  end 

  private
  
  def court_params
    params.require(:court).permit(:court_name, :court_note)
  end 

  def set_court
    @court = Court.find(params[:id])
  end

end
