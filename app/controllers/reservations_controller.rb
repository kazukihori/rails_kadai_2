class ReservationsController < ApplicationController
  require 'active_support/all'
  def index 
    
    @reservations = current_user.reservations
    
    
  end

  def confirm

    @room = Room.find(params[:reservation][:room_id])
   
    
    @reservation = Reservation.new(
      room_id: params[:reservation][:room_id],
      check_in_date: params[:reservation][:check_in_date],
      check_out_date: params[:reservation][:check_out_date],
      people_number: params[:reservation][:people_number],
      user_id: current_user.id
    )
    
    if @reservation.valid?
      @stay_date = (@reservation.check_out_date - @reservation.check_in_date).to_i
      @reservation.total_price  = @room.price * @reservation.people_number * @stay_date
      redirect_to "/confirm/reservation"
    else
      #@room = Room.find(params[:reservation][:room_id])#
      render "rooms/show"
    end
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
