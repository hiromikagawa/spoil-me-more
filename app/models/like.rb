class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  def links_this(clicked_comment)
    self.likes.find_or_create_by(comment: clicked_comment)
  end
end

