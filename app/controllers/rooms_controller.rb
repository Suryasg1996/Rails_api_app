class RoomsController < ApplicationController

  def index
    @rooms = Room.where(floor_id: params[:floor_id])
    render json: @rooms
  end

  def show
    @room = Room.where(floor_id: params[:floor_id], id: params[:id]).last
    render json: @room.floor.building
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room
    else
      render json: { error: 'Unable to create room.' }, status: 400
    end

  end

  def update
    find_room
    if @room.update(room_params)
      render json: { message: 'Room successfully updated.' }
    else
      render json: { error: 'Unable to update room.' }, status: 400
    end
  end

  def destroy
    find_room
    if @room.destroy
      render json: { message: 'Room successfully destroyed.' }
    else
      render json: { error: 'Unable to destroy room.' }, status: 400
    end
  end


  private

  def room_params
    params.require(:room).permit(:balcony, :floor_id)
  end

  def find_room
    @room = Room.find(params[:id])
  end

end
