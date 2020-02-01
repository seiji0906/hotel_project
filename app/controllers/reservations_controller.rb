class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @reservation = Reservation.new


  end

  def create
    
    @hotel = Hotel.find(params[:hotel_id])
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      flash[:notice] = "予約が完了しました！予約内容は予約履歴から確認できます！"
      redirect_to hotel_path(@hotel)
    else
      p @reservation.errors
    end
  end

  def reservation_params
    params.require(:reservation).permit(:rooms,:adults,:children,:check_in,:check_out,:hotel_id,:user_id,:hotelname)
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @reservation = Reservation.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:hotel_id])
    @reservation = Reservation.find(params[:id])
    if  @reservation.update(reservation_params)
      redirect_to hotel_reservation_path(@hotel,@reservation), data: { confirm: '予約内容を変更します。よろしいですか？' }
    end    
  end

  def destroy
    @hotel = Hotel.find(params[:hotel_id])
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to hotel_path(@hotel)
    else
     p @reservation.errors
      
    end
    
  end

  def index
    
    @reservations = current_user.reservations
  end

end
