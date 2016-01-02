class CommentsController < ApplicationController
  before_action :set_room

  def create
    @comment = Comment.create! body: params[:comment][:body], name: 'Harry', room: @room
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
