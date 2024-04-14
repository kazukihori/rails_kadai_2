class ReservationsController < ApplicationController
  def index 
    
    @reservations = current_user.reservations
    
    
  end

  def confirm

    @room = Room.find_by(params[:reservation][:room_id])

    
    @reservation = Reservation.new(
      room_id: params[:reservation][:room_id],
      check_in_date: params[:reservation][:check_in_date],
      check_out_date: params[:reservation][:check_out_date],
      people_number: params[:reservation][:people_number],
      user_id: current_user.id
    )

    

    @stay_date = @reservation.check_out_date - @reservation.check_in_date
    @reservation.total_price  = @room.price * @reservation.people_number * @stay_date

  end

  def create
    @reservation = Reservation.new(
      room_id: params[:reservation][:room_id],
      check_in_date: params[:reservation][:check_in_date],
      check_out_date: params[:reservation][:check_out_date],
      people_number: params[:reservation][:people_number],
      user_id: current_user.id,
      total_price: params[:reservation][:total_price]
    )

    if @reservation.save
      redirect_to reservations_path
    end
    
  end

  
end
