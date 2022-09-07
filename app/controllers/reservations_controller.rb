class ReservationsController < ApplicationController

  def update
    @court = Court.find(1)
    @reservation = Reservation.find(params[:id])
    if params[:part1].present?
      if @reservation.update_attributes(part1: params[:part1], part1_time: params[:part1_time])
        flash[:info] = "予約完了しました！"
      else
        flash[:danger] = "予約に失敗しました。"
      end
    elsif params[:part2].present?
      if @reservation.update_attributes(part2: params[:part2], part2_time: params[:part2_time])
        flash[:info] = "予約完了しました！"
      else
        flash[:danger] = "予約に失敗しました。"
      end
    elsif params[:part3].present?
      if @reservation.update_attributes(part3: params[:part3], part3_time: params[:part3_time])
        flash[:info] = "予約完了しました！"
      else
        flash[:danger] = "予約に失敗しました。"
      end
    elsif params[:part4].present?
      if @reservation.update_attributes(part4: params[:part4], part4_time: params[:part4_time])
        flash[:info] = "予約完了しました！"
      else
        flash[:danger] = "予約に失敗しました。"
      end
    else
      if @reservation.update_attributes(part5: params[:part5], part5_time: params[:part5_time])
        flash[:info] = "予約完了しました！"
      else
        flash[:danger] = "予約に失敗しました。"
      end             
    end      
    redirect_to @court 
  end

  def cancel
    @court = Court.find(1)
    @reservation = Reservation.find(params[:id])
    if params[:part1] == "99999"
      if @reservation.update_attributes(part1: params[:part1], part1_time: params[:part1_time])
        flash[:info] = "予約をキャンセルしました！"
      else
        flash[:danger] = "キャンセルに失敗しました。"
      end
    elsif params[:part2] == "99999"
      if @reservation.update_attributes(part2: params[:part2], part2_time: params[:part2_time])
        flash[:info] = "予約をキャンセルしました！"
      else
        flash[:danger] = "キャンセルに失敗しました。"
      end
    elsif params[:part3] == "99999"
      if @reservation.update_attributes(part3: params[:part3], part3_time: params[:part3_time])
        flash[:info] = "予約をキャンセルしました！"
      else
        flash[:danger] = "キャンセルに失敗しました。"
      end
    elsif params[:part4] == "99999"
      if @reservation.update_attributes(part4: params[:part4], part4_time: params[:part4_time])
        flash[:info] = "予約をキャンセルしました！"
      else
        flash[:danger] = "キャンセルに失敗しました。"
      end
    elsif params[:part5] == "99999"
      if @reservation.update_attributes(part5: params[:part5], part5_time: params[:part5_time])
        flash[:info] = "予約をキャンセルしました！"
      else
        flash[:danger] = "キャンセルに失敗しました。"
      end             
    end      
    redirect_to @court 
  end      

end
