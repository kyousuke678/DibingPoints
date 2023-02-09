class Point < ApplicationRecord
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :point_comments, dependent: :destroy
  
  #tag機能
  has_many :point_tags, dependent: :destroy
  has_many :tags, through: :point_tags
  
  def save_genres(tag_ids)
    tag_ids.each do |tag_id|
      point_tag = Tag.find_by(id: tag_id) #データベースから紐ずいてる情報をとってきている
      self.tags << point_tag  #投稿されたtagの中身を中間テーブルに送っている
    end
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
