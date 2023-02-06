class Point < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :point_comments, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
