class RoomsController < ApplicationController
  def index
    @user = current_user
    @rooms = Room.where(user_id: @user.id)
  end

  def show
   
    @room = Room.find(params[:id])
    @user = current_user
   
    @reservation = Reservation.new
    
    
    
    
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def edit
    @room = Room.find_by(id: params[:id])
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :room_introduction, :price, :address, :user_id, :room_img))
    if @room.save
      flash[:notice]= "新規登録しました"  
      redirect_to "/"
    end
  end

  def update
    @room = Room.find_by(id: params[:id])
    if @room.update(params.require(:room).permit(:name, :room_introduction, :price, :address, :user_id, :room_img))
       redirect_to room_path
    end
  end
  def room_search_result
    @rooms = Room.all_search(params[:search])
    @cnt = Room.all_search(params[:search]).count
    
  end
  def area_search_result
    @rooms = Room.area_search(params[:search])
    @cnt = Room.area_search(params[:search]).count
    render "/rooms/room_search_result"
  end

end
