class Best < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  def links_this(clicked_post)
    self.likes.find_or_create_by(tweet: clicked_tweet)
  end
end
