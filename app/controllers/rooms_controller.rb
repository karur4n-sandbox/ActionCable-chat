class RoomsController < ApplicationController
  def show
    @room = find_room
    @comments = Comment.where(room_id: @room.id)
  end

  def create
    @room = Room.create!
    redirect_to @room
  end

  def find_room
    Room.find(params[:id].to_i)
  end
end
