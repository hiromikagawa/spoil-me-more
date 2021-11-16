class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
  end
  has_many :tweets
  has_many :comments
  has_many :bests
  has_many :favorites, through: :bests, source: :tweet
  def best_this(clicked_tweet)
    self.bests.find_or_create_by(tweet: clicked_tweet)
  end
  #フォロー取得
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
#フォローしているか確認
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end
#フォローする
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end
#フォローを外す
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end
