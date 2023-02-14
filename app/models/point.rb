class Point < ApplicationRecord
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :point_comments, dependent: :destroy
  
  #tag機能
  has_many :point_tags, dependent: :destroy
  has_many :tags, through: :point_tags
  
  # 投稿数の前日比・前週比
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } #今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } #前日
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } #前週
  # 7日間分の投稿数
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } #今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } #前日
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } #2日前
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } #3日前
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } #4日前
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } #5日前
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } #6日前
  
  validates :name,presence:true
  validates :body,presence:true,length:{minimum: 2,maximum:200}
  validates :rate,presence:true
  validates :tag, acceptance: true
  
  def save_genres(tag_ids)
    tag_ids.each do |tag_id|
      point_tag = Tag.find_by(id: tag_id) #データベースから紐ずいてる情報をとってきている
      self.tags << point_tag  #投稿されたtagの中身を中間テーブルに送っている
    end
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search(keyword)
    where(["name like? OR body like? OR address like?", "%#{keyword}%", "%#{keyword}%","%#{keyword}%"])
  end
end
