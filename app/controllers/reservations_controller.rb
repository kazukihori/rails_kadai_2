class ReservationsController < ApplicationController
  require 'active_support/all'
  def index 
    
    @reservations = current_user.reservations
    
    
  end

  def confirm
    
   
   
  
    @reservation = Reservation.new(reservation_create)
    @room = @reservation.room
    if @reservation.valid?
      @stay_date = (@reservation.check_out_date - @reservation.check_in_date).to_i
      @reservation.total_price  = @room.price * @reservation.people_number * @stay_date
      redirect_to "/confirm/reservation"
    else
      render "rooms/show"
      binding.pry
    end
  end

  def create
    @reservation = Reservation.new(
      room_id: params[:reservation][:room_id],
      check_in_date: params[:reservation][:check_in_date],
      check_out_date: params[:reservation][:check_out_date],
      people_number: params[:reservation][:people_number],
      total_price: params[:reservation][:total_price]
    )

    if @reservation.save
      redirect_to reservations_path
    end
    
  end
  

  def reservation_create
    params.require(:reservation).permit(:room_id, :check_in_date, :check_out_date, :people_number)
  end

  
end
