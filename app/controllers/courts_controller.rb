class CourtsController < ApplicationController
  before_action :set_court, only: [:edit, :update, :destroy]
  before_action :set_court2, only: :show
  before_action :set_one_month, only: :show

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

  def show
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
  
  def set_court2
    @court = Court.find(1)
  end

end
