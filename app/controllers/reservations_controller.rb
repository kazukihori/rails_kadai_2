class ReservationsController < ApplicationController
  require 'active_support/all'
  def index 
    
    @reservations = current_user.reservations
    
    
  end

  def confirm
      @reservation = Reservation.new(reservation_create)
      @room = @reservation.room
      @reservation.user = current_user

      if @reservation.valid?
        @stay_date = (@reservation.check_out_date - @reservation.check_in_date).to_i
        @reservation.total_price  = @room.price * @reservation.people_number * @stay_date
     else
        render "rooms/show"
     
      end

  end

  

  def create
    @reservation = Reservation.new(reservation_save)
    @room = @reservation.room
   


    if @reservation.save
      redirect_to reservations_path
    else
      render "rooms/show"
    end
    
  end
  

  def reservation_create
    params.require(:reservation).permit(:room_id, :check_in_date, :check_out_date, :people_number)
  end

  def reservation_save
    params.require(:reservation).permit(:room_id, :check_in_date, :check_out_date, :people_number, :user_id, :total_price)
  end
  
end
