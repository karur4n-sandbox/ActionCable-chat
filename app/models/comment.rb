class Comment < ApplicationRecord
  belongs_to :room

  after_create_commit { AddCommentJob.perform_later(self) }
end
