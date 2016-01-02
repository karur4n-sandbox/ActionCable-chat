class AddCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    ActionCable.server.broadcast "room:#{comment.room_id}:comments",
      comment: comment.body
  end
end
